bool _loginState = false;
bool get loginPage => _loginState;

setLoginState(bool login) {
  _loginState = login;
}

// URLS
const BASE_URL = "https://techtest.youapp.ai/";

const loginUsername = "username";
const loginEmail = "email";
const loginName = "name";
const loginAccessToken = "accessToken";
