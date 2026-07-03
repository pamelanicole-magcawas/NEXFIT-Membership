<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        // Guard: only add the column if it doesn't already exist.
        // The column may have been added manually or by a prior migration attempt.
        if (!Schema::hasColumn('member_packages', 'status')) {
            Schema::table('member_packages', function (Blueprint $table) {
                $table->enum('status', ['Active', 'Expired'])->default('Active')->after('payment_mode');
            });
        }

        // Back-fill: any package whose coverage_end is in the past is Expired.
        DB::statement("
            UPDATE member_packages
            SET status = 'Expired'
            WHERE coverage_end < CURDATE()
              AND status = 'Active'
        ");
    }

    public function down(): void
    {
        Schema::table('member_packages', function (Blueprint $table) {
            $table->dropColumn('status');
        });
    }
};
