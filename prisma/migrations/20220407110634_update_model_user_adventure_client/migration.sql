-- CreateTable
CREATE TABLE "users" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,
    "email" TEXT NOT NULL,
    "pasword" TEXT NOT NULL,
    "firstName" TEXT,
    "lastName" TEXT,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "m_adventure" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,
    "m_user_id" INTEGER NOT NULL,
    "r_adventure_bank_id" INTEGER NOT NULL,
    "m_rank_adventure_id" INTEGER NOT NULL,
    "r_has_skill_id" INTEGER NOT NULL,

    CONSTRAINT "m_adventure_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "m_client" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,
    "m_user_id" INTEGER NOT NULL,
    "m_clan_id" INTEGER NOT NULL,
    "r_client_bank_id" INTEGER NOT NULL,

    CONSTRAINT "m_client_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- AddForeignKey
ALTER TABLE "m_adventure" ADD CONSTRAINT "m_adventure_m_user_id_fkey" FOREIGN KEY ("m_user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "m_client" ADD CONSTRAINT "m_client_m_user_id_fkey" FOREIGN KEY ("m_user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
