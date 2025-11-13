// 🌍 Base URL
const String baseUrl = 'https://accessories-eshop.runasp.net/api/';

// 🔐 Auth Endpoints
const String signUpApi = 'auth/register';
const String loginApi = 'auth/login';
const String verifyEmailApi = 'auth/verify-email';
const String resendOtpApi = 'auth/resend-otp';
const String forgotPasswordApi = 'auth/forgot-password';
const String validateOtpApi = 'auth/validate-otp';
const String resetPasswordApi = 'auth/reset-password';
const String changePasswordApi = 'auth/change-password';
const String logoutApi = 'auth/logout';
const String refreshTokenApi = 'auth/refresh-token';
const String meApi = 'auth/me';

// 🔹 Google Auth
const String googleLoginApi = 'auth/google/login';
const String googleCallbackApi = 'auth/google/callback';
const String googleMobileApi = 'auth/google/mobile';

// 🌎 Public Endpoints
const String countriesApi = 'public/countries';
const String locationsApi = 'public/register_locations';

// 🛍 Categories
const String getAllCategoriesApi = 'categories';
const String getCategoryByIdApi = 'categories/'; // + categoryId

// 🛒 Products
const String getAllProductsApi = 'products';
const String getProductByIdApi = 'products/'; // + productId
