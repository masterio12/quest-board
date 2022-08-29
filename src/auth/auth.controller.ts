import { Body, Controller, HttpCode, HttpStatus, Post } from '@nestjs/common';
import { AuthService } from './auth.service';
import { dataAuth, dataAuthlogin } from './dto';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}


  @Post('signup')
  signup(@Body() dataauth: dataAuth){
    return this.authService.singup(dataauth)
  }

  @HttpCode(HttpStatus.OK)
  @Post('login')
  signin(@Body() datas:dataAuthlogin){
    return this.authService.signin(datas)
  }
}
