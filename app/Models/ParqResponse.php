<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

// REQ-MM-05: Pre-Exercise Health Questionnaire responses
class ParqResponse extends Model
{
    protected $fillable = [
        'member_id', 'assessment_date',
        'has_heart_condition', 'has_chest_pain', 'has_dizziness',
        'has_bone_joint_problem', 'on_medication', 'has_other_condition',
        'other_condition_details', 'additional_notes', 'assessed_by',
    ];

    protected $casts = [
        'assessment_date'      => 'date',
        'has_heart_condition'  => 'boolean',
        'has_chest_pain'       => 'boolean',
        'has_dizziness'        => 'boolean',
        'has_bone_joint_problem' => 'boolean',
        'on_medication'        => 'boolean',
        'has_other_condition'  => 'boolean',
    ];

    public function member()
    {
        return $this->belongsTo(Member::class);
    }

    // If any ParQ flag is true, member should be Special Population
    public function isSpecialPopulation(): bool
    {
        return $this->has_heart_condition
            || $this->has_chest_pain
            || $this->has_dizziness
            || $this->has_bone_joint_problem
            || $this->on_medication
            || $this->has_other_condition;
    }
}
