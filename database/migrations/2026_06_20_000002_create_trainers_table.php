<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        // Trainer assignment during enrollment
        Schema::create('trainers', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->timestamps();
        });

        // Seed the three sample trainers
        foreach (['Ryan M.', 'Mark D.', 'Sarah L.'] as $name) {
            DB::table('trainers')->insert([
                'name'       => $name,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }

        // Link members.assigned_trainer_id -> trainers.id
        Schema::table('members', function (Blueprint $table) {
            $table->foreign('assigned_trainer_id')
                  ->references('id')->on('trainers')
                  ->onDelete('set null');
        });
    }

    public function down(): void
    {
        Schema::table('members', function (Blueprint $table) {
            $table->dropForeign(['assigned_trainer_id']);
        });

        Schema::dropIfExists('trainers');
    }
};
