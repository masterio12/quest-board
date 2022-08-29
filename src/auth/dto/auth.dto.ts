import { IsEmail, IsNotEmpty, IsString } from "class-validator";


export class dataAuth{

    @IsEmail()
    @IsNotEmpty()
    email:string;

    @IsNotEmpty()
    password:string;

    @IsString()
    firstName:string;

    @IsString()
    lastName:string;
}

export class dataAuthlogin{

    @IsEmail()
    @IsNotEmpty()
    email:string;

    @IsNotEmpty()
    password:string;

}