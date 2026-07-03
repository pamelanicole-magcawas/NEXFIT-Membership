<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MemberController;

Route::get('/', function () {
    return redirect()->route('members.index');
});

// Membership Management — REQ-MM-01 to REQ-MM-09
Route::resource('members', MemberController::class);

// Manual expiry check — must be defined BEFORE the resource to avoid
// Laravel matching "expire-memberships" as a {member} wildcard.
Route::post('members/expire-memberships', [MemberController::class, 'expireMemberships'])
    ->name('members.expire');

// REQ-MM-RENEW: renewal flow
Route::get('members/{member}/renew',  [MemberController::class, 'renewForm'])->name('members.renew');
Route::post('members/{member}/renew', [MemberController::class, 'renew'])->name('members.renew.store');