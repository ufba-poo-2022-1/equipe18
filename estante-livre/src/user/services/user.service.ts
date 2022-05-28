import { Injectable } from '@nestjs/common';

import { IUser } from '../schemas/user.interface';

import { AuthService } from 'src/auth/services/auth.service';
import { Model } from 'mongoose';
import { InjectModel } from '@nestjs/mongoose';
import { IUserResponse } from '../schemas/user-response.interface';

@Injectable()
export class UserService {
  constructor(
    @InjectModel('User') private readonly userModel: Model<IUser>,
    private authService: AuthService,
  ) {}

  async create(user: IUser) {
    const passwordHash = this.authService.hashPassword(user.password);
    const newUser = new this.userModel();
    newUser.name = user.name;
    newUser.email = user.email;
    newUser.password = await passwordHash;
    newUser.save();
    const { password, ...result } = user;
    return result;
  }

  async findOne(id: number): Promise<IUserResponse> {
    const user = await this.userModel.findById({ _id: id }).exec();

    const { password, ...withoutPassword } = user;

    const response = {} as IUserResponse;
    return Object.assign(response, withoutPassword);
  }

  deleteOne(id: number) {
    return this.userModel.remove({ _id: id });
  }

  async login(user: IUser): Promise<string> {
    const uservalidated = await this.validateUser(user.email, user.password);
    if (uservalidated) {
      return this.authService.generateJWT(user);
    } else {
      return 'Wrong Credentials';
    }
  }

  async validateUser(email: string, password: string) {
    const user = await this.userModel.findOne({ email });
    return this.authService.comparePasswords(password, user.password);
  }

  async findByMail(email: string) {
    return this.userModel.findOne({ email }).exec();
  }
}
