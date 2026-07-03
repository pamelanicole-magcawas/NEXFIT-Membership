<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Member extends Model
{
    use SoftDeletes; // REQ SR-2: soft delete only

    protected $fillable = [
        'full_name', 'email', 'phone', 'birthdate', 'address',
        'emergency_contact_name', 'emergency_contact_phone',
        'enrollment_date', 'fitness_level', 'population_class',
        'status', 'assigned_trainer_id',
    ];

    protected $casts = [
        'enrollment_date' => 'date',
        'birthdate'       => 'date',
    ];

    // Assigned trainer
    public function trainer()
    {
        return $this->belongsTo(Trainer::class, 'assigned_trainer_id');
    }

    // REQ-MM-02: all membership packages
    public function packages()
    {
        return $this->hasMany(MemberPackage::class);
    }

    /**
     * The member's currently Active package (status = Active).
     * This is the source of truth for membership validity.
     */
    public function activePackage()
    {
        return $this->hasOne(MemberPackage::class)
            ->where('status', 'Active')
            ->latest('coverage_start');
    }

    // REQ-MM-05: ParQ
    public function parqResponses()
    {
        return $this->hasMany(ParqResponse::class);
    }

    public function latestParq()
    {
        return $this->hasOne(ParqResponse::class)->latest('assessment_date');
    }

    // REQ-MM-07: health flags
    public function healthFlags()
    {
        return $this->hasMany(MemberHealthFlag::class);
    }

    /**
     * REQ-MM-04: true when the active package ends within 7 days,
     * OR when the member has no active package at all (fully expired).
     * Used to decide whether to show the Renew button.
     */
    public function isNearExpiry(): bool
    {
        $pkg = $this->activePackage;

        if (!$pkg) {
            // No active package — member needs renewal
            return $this->packages()->exists();
        }

        return now()->diffInDays($pkg->coverage_end, false) <= 7;
    }
}
