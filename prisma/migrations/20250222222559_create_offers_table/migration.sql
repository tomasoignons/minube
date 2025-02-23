-- CreateEnum
CREATE TYPE "ACCOUNT_ACCESS" AS ENUM ('READ_ONLY', 'READ_WRITE', 'ADMIN', 'OWNER');

-- CreateTable
CREATE TABLE "users" (
    "id" SERIAL NOT NULL,
    "supabase_uid" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "display_name" TEXT,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "membership" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "account_id" INTEGER NOT NULL,
    "access" "ACCOUNT_ACCESS" NOT NULL DEFAULT 'READ_ONLY',
    "pending" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "membership_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "account" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "current_period_ends" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "features" TEXT[],
    "plan_id" INTEGER NOT NULL,
    "plan_name" TEXT NOT NULL,
    "max_notes" INTEGER NOT NULL DEFAULT 100,
    "stripe_subscription_id" TEXT,
    "stripe_customer_id" TEXT,
    "max_members" INTEGER NOT NULL DEFAULT 1,
    "join_password" TEXT NOT NULL,
    "ai_gen_max_pm" INTEGER NOT NULL DEFAULT 7,
    "ai_gen_count" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "account_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "plan" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "features" TEXT[],
    "max_notes" INTEGER NOT NULL DEFAULT 100,
    "stripe_product_id" TEXT,
    "max_members" INTEGER NOT NULL DEFAULT 1,
    "ai_gen_max_pm" INTEGER NOT NULL DEFAULT 7,

    CONSTRAINT "plan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "note" (
    "id" SERIAL NOT NULL,
    "account_id" INTEGER,
    "note_text" TEXT NOT NULL,

    CONSTRAINT "note_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Offer" (
    "id" SERIAL NOT NULL,
    "account_id" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "categories" TEXT[],
    "image" TEXT NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Offer_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "membership_user_id_account_id_key" ON "membership"("user_id", "account_id");

-- CreateIndex
CREATE UNIQUE INDEX "account_join_password_key" ON "account"("join_password");

-- CreateIndex
CREATE UNIQUE INDEX "plan_name_key" ON "plan"("name");

-- AddForeignKey
ALTER TABLE "membership" ADD CONSTRAINT "membership_account_id_fkey" FOREIGN KEY ("account_id") REFERENCES "account"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "membership" ADD CONSTRAINT "membership_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "account" ADD CONSTRAINT "account_plan_id_fkey" FOREIGN KEY ("plan_id") REFERENCES "plan"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "note" ADD CONSTRAINT "note_account_id_fkey" FOREIGN KEY ("account_id") REFERENCES "account"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Offer" ADD CONSTRAINT "Offer_account_id_fkey" FOREIGN KEY ("account_id") REFERENCES "account"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
