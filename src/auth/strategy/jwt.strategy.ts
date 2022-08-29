
import { Injectable } from "@nestjs/common";
import { ConfigService } from "@nestjs/config";
import { PassportStrategy } from "@nestjs/passport";
import { ExtractJwt, Strategy } from "passport-jwt";
import { PrismaService } from "src/prisma/prisma.service";


@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy,'jwt'){
    constructor(
     config: ConfigService,
    private prisma: PrismaService
    ){
        super({
            jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
            // ignore expiration just for debug 
            ignoreExpiration: true,
            secretOrKey:config.get('JWT_SECRET'),
        })
    }
    async validate(payload: {
        id:number,
        email:string
    }){

        const user = await this.prisma.m_user.findUnique({
            where:{
                id:payload.id
            }
        })

        delete user.pasword;
        delete user.createdAt;
        delete user.updateAt;
            console.log("yahaha keluar");
            
    //    this.data_user(payload)
        return user ; 
    }


    // data_user(data: any){

    //     console.log(data,"test data");
        
    // }
}