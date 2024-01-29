-- Drop foreign keys before dropping tables
ALTER TABLE IF EXISTS "entries" DROP CONSTRAINT IF EXISTS entries_account_id_fkey;
ALTER TABLE IF EXISTS "transfers" DROP CONSTRAINT IF EXISTS transfers_from_account_id_fkey;
ALTER TABLE IF EXISTS "transfers" DROP CONSTRAINT IF EXISTS transfers_to_account_id_fkey;

-- Drop the tables only if they exist
DROP TABLE IF EXISTS "transfers";
DROP TABLE IF EXISTS "entries";
DROP TABLE IF EXISTS "accounts";

-- Drop the 'transfer_type' type only if it exists
DO $$ BEGIN
    DROP TYPE IF EXISTS "transfer_type";
EXCEPTION
    WHEN invalid_table_definition THEN
        -- Ignore if 'transfer_type' does not exist
END $$;
