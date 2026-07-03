<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        DB::statement("ALTER TABLE members MODIFY COLUMN status ENUM('Active', 'Inactive', 'Churned', 'Expired') NOT NULL DEFAULT 'Active'");
    }

    public function down(): void
    {
        DB::statement("ALTER TABLE members MODIFY COLUMN status ENUM('Active', 'Inactive', 'Churned') NOT NULL DEFAULT 'Active'");
    }
};
