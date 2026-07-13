<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MemberController;
use App\Http\Controllers\TrainerController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\RegisterController;

// Landing page: send an already-signed-in staff member straight to the
// dashboard; everyone else lands on the login screen instead of skipping
// straight into the members list unauthenticated.
Route::get('/', function () {
    if (auth('staff')->check()) {
        return redirect()->route('dashboard');
    }

    if (auth('trainer')->check()) {
        return redirect()->route('trainer.dashboard');
    }

    return redirect()->route('login');
});

Route::middleware('auth:staff')->group(function () {
    // Membership Management — REQ-MM-01 to REQ-MM-09
    Route::resource('members', MemberController::class);

    // Manual expiry check — must be defined BEFORE the resource to avoid
    // Laravel matching "expire-memberships" as a {member} wildcard.
    Route::post('members/expire-memberships', [MemberController::class, 'expireMemberships'])
        ->name('members.expire');

    // REQ-MM-RENEW: renewal flow
    Route::get('members/{member}/renew',  [MemberController::class, 'renewForm'])->name('members.renew');
    Route::post('members/{member}/renew', [MemberController::class, 'renew'])->name('members.renew.store');
});

Route::middleware('guest')->group(function () {
    Route::get('/login', [LoginController::class, 'create'])->name('login');
    Route::post('/login', [LoginController::class, 'store']);

    Route::get('/register', [RegisterController::class, 'create'])->name('register');
    Route::post('/register', [RegisterController::class, 'store']);
});

Route::post('/logout', [LoginController::class, 'destroy'])
    ->middleware('auth:staff,trainer')
    ->name('logout');

// Temporary placeholder routes so the Blade views' route() calls resolve.
// Swap the closures for real controllers/views as you build these pages out.
Route::get('/dashboard', function () {
    // No standalone dashboard view has been built yet — the members list is
    // the closest thing to a staff "home" page right now, so land there.
    return redirect()->route('members.index');
})->middleware('auth:staff')->name('dashboard');

Route::middleware('auth:trainer')->prefix('trainer')->name('trainer.')->group(function () {
    Route::get('/home', [TrainerController::class, 'home'])->name('home');
    Route::get('/dashboard', [TrainerController::class, 'dashboard'])->name('dashboard');
    Route::get('/members', [TrainerController::class, 'members'])->name('members');
    Route::get('/schedule', [TrainerController::class, 'schedule'])->name('schedule');
    Route::get('/training-plan', [TrainerController::class, 'trainingPlan'])->name('training-plan');
});

Route::get('/forgot-password', function () {
    return 'Forgot password placeholder — build this next.';
})->name('password.request');