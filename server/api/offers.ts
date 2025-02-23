import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
  try {
    const offers = await prisma.offer.findMany();
    return offers;
  } catch (error) {
    console.error('Error fetching offers:', error);
    throw createError({ statusCode: 500, statusMessage: 'Internal Server Error' });
  }
});