-- CreateTable
CREATE TABLE "m_clan" (
    "id" SERIAL NOT NULL,
    "clan_name" TEXT,

    CONSTRAINT "m_clan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "m_rank_adventure" (
    "id" SERIAL NOT NULL,
    "grade_name" TEXT,

    CONSTRAINT "m_rank_adventure_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "m_grade_client" (
    "id" SERIAL NOT NULL,
    "grade_name" TEXT,

    CONSTRAINT "m_grade_client_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "m_skill" (
    "id" SERIAL NOT NULL,
    "skill_name" TEXT,

    CONSTRAINT "m_skill_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "m_boards" (
    "id" SERIAL NOT NULL,
    "t_quest_id" INTEGER NOT NULL,
    "category_quest" TEXT NOT NULL,
    "desc" TEXT,

    CONSTRAINT "m_boards_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "t_quest" (
    "id" SERIAL NOT NULL,
    "main_desc" TEXT,
    "sec_desc" TEXT,
    "m_client_id" INTEGER NOT NULL,
    "r_post_skill_id" INTEGER NOT NULL,
    "reward" TEXT,

    CONSTRAINT "t_quest_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "t_contract" (
    "id" SERIAL NOT NULL,
    "t_proposal_id" INTEGER NOT NULL,
    "r_adventure_proposal_and_contract_id" INTEGER NOT NULL,
    "r_client_proposal_and_contract_id" INTEGER NOT NULL,
    "start_time" TIMESTAMP(3) NOT NULL,
    "end_time" TIMESTAMP(3) NOT NULL,
    "t_payment_id" INTEGER NOT NULL,
    "min_reward" TEXT,
    "max_reward" TEXT,

    CONSTRAINT "t_contract_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "t_proposal" (
    "id" SERIAL NOT NULL,
    "t_quest_id" INTEGER NOT NULL,
    "m_adventure_id" INTEGER NOT NULL,
    "proposal_time" TIMESTAMP(3) NOT NULL,
    "t_payment_id" INTEGER NOT NULL,
    "m_grade_client" TEXT NOT NULL,
    "client_comment" TEXT,
    "m_rank_adventure" INTEGER NOT NULL,
    "adventure_comment" TEXT,
    "r_proposal_status_id" INTEGER NOT NULL,
    "reward_request" TEXT,

    CONSTRAINT "t_proposal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "t_message" (
    "id" SERIAL NOT NULL,
    "m_client_id" INTEGER NOT NULL,
    "m_adventure_id" INTEGER NOT NULL,
    "message_time" TIMESTAMP(3) NOT NULL,
    "message_text" TEXT,
    "t_proposal_id" INTEGER NOT NULL,
    "r_proposal_status_id" INTEGER NOT NULL,

    CONSTRAINT "t_message_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "t_attachment" (
    "id" SERIAL NOT NULL,
    "t_proposal_id" INTEGER NOT NULL,
    "t_message_id" INTEGER NOT NULL,
    "attachment_link" TEXT,

    CONSTRAINT "t_attachment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "r_client_bank" (
    "id" SERIAL NOT NULL,
    "priority" TEXT,
    "m_bank_id" INTEGER NOT NULL,
    "atm" TEXT,

    CONSTRAINT "r_client_bank_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "r_post_skill" (
    "id" SERIAL NOT NULL,
    "m_post_id" INTEGER NOT NULL,
    "m_skill_id" INTEGER NOT NULL,

    CONSTRAINT "r_post_skill_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "r_adventure_bank" (
    "id" SERIAL NOT NULL,
    "priority" TEXT,
    "m_bank_id" INTEGER NOT NULL,
    "atm" TEXT,

    CONSTRAINT "r_adventure_bank_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "r_has_skill" (
    "id" SERIAL NOT NULL,
    "m_adventure_id" INTEGER NOT NULL,
    "m_skill_id" INTEGER NOT NULL,

    CONSTRAINT "r_has_skill_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "r_adventure_proposal_and_contract" (
    "id" SERIAL NOT NULL,
    "m_adventure_id" INTEGER NOT NULL,
    "registration_date" TIMESTAMP(3) NOT NULL,
    "overview" TEXT NOT NULL,

    CONSTRAINT "r_adventure_proposal_and_contract_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "r_client_proposal_and_contract" (
    "id" SERIAL NOT NULL,
    "m_clan_id" INTEGER NOT NULL,
    "registration_date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "r_client_proposal_and_contract_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "r_proposal_status" (
    "id" SERIAL NOT NULL,
    "status" TEXT NOT NULL,

    CONSTRAINT "r_proposal_status_pkey" PRIMARY KEY ("id")
);
