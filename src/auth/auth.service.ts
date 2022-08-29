import { ForbiddenException, Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { JwtService } from '@nestjs/jwt';
import { PrismaClientKnownRequestError } from '@prisma/client/runtime';
import * as argon from 'argon2';
import { PrismaService } from 'src/prisma/prisma.service';
import { dataAuth, dataAuthlogin } from './dto';

@Injectable()
export class AuthService {
constructor(
    private prisma : PrismaService,
    private jwt: JwtService,
    private config: ConfigService,
){} 
    // signup  daftar
    async singup(data : dataAuth){
        try{
            const hash = await argon.hash(data.password);

            // console.log(data,"test data terima");
            
            const user = await this.prisma.m_user.create({
                data:{
                    email:data.email,
                    pasword:hash,
                    firstName:data.firstName,
                    lastName:data.lastName
                },
                select: {
                    id: true,
                    email: true,
                    createdAt: true,
                  },
            })
            
            
            return user
        }
            catch (err) {
                if (err instanceof PrismaClientKnownRequestError) {
                  if (err.code === 'P2002')
                    throw new ForbiddenException(['email Already Taken']);
                }
                throw err;
              }
        
    }
    // signin or login
    async signin(data : dataAuthlogin){

        const user = await this.prisma.m_user.findUnique({
            where:{
                email:data.email
            }
        })

        // if(!user) throw new ForbiddenException('This Email not registered');
        if(!user) throw new ForbiddenException(
            {
                statusCode: 403,
                data: {
                    email:"email salah"
                },
                message:['This email not registered'],
                error: 'Forbidden'
              }
        );

        const pw_match = await argon.verify(user.pasword, data.password)

        if (!pw_match) throw new ForbiddenException(
            {
                statusCode: 403,
                data: {
                    pw:"Password salah"
                },
                message:'Password not Registered',
                error: 'Forbidden'
              }
            
        );


        
        return this.logintoken(user.id, user.email)
    }
    async logintoken(userId: number, email:string):Promise<{}>{

        const payload={
            id:userId,
            email,
        }

        const secret = this.config.get('JWT_SECRET')

        const token = await this.jwt.signAsync(payload,{
            expiresIn:'15m',
            secret:secret,
        })


        return{
            user_email:email,
            access_token:token,
        }
    }
}
