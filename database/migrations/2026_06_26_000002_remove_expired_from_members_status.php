<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * members.status should only reflect gym account state: Active | Inactive | Churned.
     * Expired is no longer a valid member status; expiration is tracked per-package.
     *
     * Before shrinking the ENUM we convert any existing 'Expired' member rows
     * to 'Inactive' so no data is lost.
     */
    public function up(): void
    {
        // Safely migrate any members whose status was previously set to Expired.
        DB::statement("UPDATE members SET status = 'Inactive' WHERE status = 'Expired'");

        DB::statement("ALTER TABLE members MODIFY COLUMN status ENUM('Active', 'Inactive', 'Churned') NOT NULL DEFAULT 'Active'");
    }

    public function down(): void
    {
        DB::statement("ALTER TABLE members MODIFY COLUMN status ENUM('Active', 'Inactive', 'Churned', 'Expired') NOT NULL DEFAULT 'Active'");
    }
};
