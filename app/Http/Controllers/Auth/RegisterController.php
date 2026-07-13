<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\Trainer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class RegisterController extends Controller
{
    public function create()
    {
        return view('auth.register');
    }

    /**
     * Register a new trainer account.
     *
     * Sign-up is for trainers only — staff/admin accounts are predefined
     * and provisioned by an administrator (see StaffSeeder), not
     * self-registered.
     *
     * Per the studio's request, "email" is validated as a required string
     * only — no format/regex enforcement. Duplicate emails are still
     * blocked via the `unique` rule below.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name'     => ['required', 'string', 'max:255'],
            'email'    => ['required', 'string', 'max:255', 'unique:trainers,email'],
            'phone'    => ['required', 'string', 'max:20'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
            'consent'  => ['accepted'],
        ]);

        $trainer = Trainer::create([
            'name'     => $validated['name'],
            'email'    => $validated['email'],
            'phone'    => $validated['phone'],
            'password' => Hash::make($validated['password']),
        ]);

        Auth::guard('trainer')->login($trainer);

        return redirect()->route('trainer.dashboard')
            ->with('status', 'Account created! Welcome to Fit Urban.');
    }
}
