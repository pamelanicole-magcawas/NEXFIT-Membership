<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        // REQ-MM-01: member profile
        Schema::create('members', function (Blueprint $table) {
            $table->id();
            $table->string('full_name');
            $table->string('email')->unique();
            $table->string('phone', 20)->nullable();
            $table->date('birthdate')->nullable();
            $table->string('address')->nullable();
            $table->string('emergency_contact_name')->nullable();
            $table->string('emergency_contact_phone', 20)->nullable();
            $table->date('enrollment_date');
            $table->enum('fitness_level', ['Fundamentals', 'Mid-Level', 'Advanced'])->default('Fundamentals');
            // REQ-MM-06: General or Special Population
            $table->enum('population_class', ['General', 'Special'])->default('General');
            // REQ-MM-01: member status
            $table->enum('status', ['Active', 'Inactive', 'Churned'])->default('Active');
            $table->unsignedBigInteger('assigned_trainer_id')->nullable();
            $table->timestamps();
            $table->softDeletes(); // REQ SR-2: soft delete only per RA 10173
        });

        // REQ-MM-07: Special Population flags
        Schema::create('member_health_flags', function (Blueprint $table) {
            $table->id();
            $table->foreignId('member_id')->constrained()->onDelete('cascade');
            $table->string('condition'); // e.g. hypertension, pregnancy, injury
            $table->text('notes')->nullable();
            $table->timestamps();
        });

        // REQ-MM-02 & REQ-MM-03: membership packages
        Schema::create('member_packages', function (Blueprint $table) {
            $table->id();
            $table->foreignId('member_id')->constrained()->onDelete('cascade');
            $table->enum('package_type', [
                'Single Session',
                'Monthly',
                '3-Month',
                '6-Month',
                'Annual',
                'Student Rate',
                'PWD Rate',
            ]);
            $table->date('purchase_date');
            $table->date('coverage_start');
            $table->date('coverage_end');
            $table->integer('session_credits'); // total credits given
            $table->integer('credits_used')->default(0);
            $table->integer('credits_remaining')->virtualAs('session_credits - credits_used');
            $table->decimal('amount_paid', 10, 2);
            $table->string('payment_mode')->default('Cash'); // cash, gcash, etc — recorded for reference only (BR-4)
            $table->unsignedBigInteger('processed_by')->nullable(); // staff id
            $table->timestamps();
        });

        // REQ-MM-05: ParQ responses
        Schema::create('parq_responses', function (Blueprint $table) {
            $table->id();
            $table->foreignId('member_id')->constrained()->onDelete('cascade');
            $table->date('assessment_date');
            $table->boolean('has_heart_condition')->default(false);
            $table->boolean('has_chest_pain')->default(false);
            $table->boolean('has_dizziness')->default(false);
            $table->boolean('has_bone_joint_problem')->default(false);
            $table->boolean('on_medication')->default(false);
            $table->boolean('has_other_condition')->default(false);
            $table->text('other_condition_details')->nullable();
            $table->text('additional_notes')->nullable();
            $table->unsignedBigInteger('assessed_by')->nullable(); // staff id
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('parq_responses');
        Schema::dropIfExists('member_health_flags');
        Schema::dropIfExists('member_packages');
        Schema::dropIfExists('members');
    }
};
