import 'package:flutter/material.dart';

class WelcomeProvider extends ChangeNotifier{

bool _showRegisterMenu = false;
int _createAccount = 0;
bool _showLoginMenu = false;
bool _showRecoverPasswordMenu = false;



void setShowRegisterMenu(){
  _showRegisterMenu = !_showRegisterMenu;
  notifyListeners();
}

void setShowLoginMenu(){
  _showLoginMenu =!_showLoginMenu;
  notifyListeners();
}

void setCreateAccount(int value){
  _createAccount = value;
  notifyListeners();
}

void setShowRecoverPasswordMenu(){
  _showRecoverPasswordMenu = !_showRecoverPasswordMenu;
  notifyListeners();
}

int getCreateAccount() => _createAccount;

bool getShowRegisterMenu() => _showRegisterMenu;

bool getShowLoginMenu() => _showLoginMenu;

bool getShowRecoverPasswordMenu() => _showRecoverPasswordMenu;

}