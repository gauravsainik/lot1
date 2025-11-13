# DreamRide Lucky Draw - Complete Setup Guide

A premium web application for automotive lucky draw campaigns with secure payment integration.

## 🚀 Features

- **Premium Automotive Design**: Dark theme with smooth animations
- **Secure Payment Gateway**: Razorpay integration for ₹99 tickets
- **Email Notifications**: Automatic ticket confirmation via EmailJS
- **Responsive Design**: Mobile-first approach with Tailwind CSS
- **Clean Architecture**: Separation of frontend and backend concerns
- **Production Ready**: Error handling, validation, and security best practices

## 📁 Project Structure

```
dreamride-lucky-draw/
├── frontend/
│   ├── index.html      # Homepage with hero section and bike showcase
│   ├── buy.html        # Ticket purchase page with payment integration
│   └── result.html     # Results page with countdown timer
├── backend/
│   ├── server.js       # Express.js API server
│   ├── package.json    # Node.js dependencies
│   └── .env.example    # Environment variables template
└── README.md           # This file
```

## 🛠️ Backend Setup

### 1. Navigate to Backend Directory
```bash
cd dreamride-lucky-draw/backend
```

### 2. Initialize Node.js Project (if needed)
```bash
npm init -y
```

### 3. Install Dependencies
```bash
npm install express razorpay cors dotenv
npm install --save-dev nodemon
```

### 4. Configure Environment Variables
```bash
cp .env.example .env
```

Edit `.env` file with your credentials:
```env
# Razorpay Configuration (Get from https://dashboard.razorpay.com/)
RAZORPAY_KEY_ID=rzp_test_your_key_id_here
RAZORPAY_KEY_SECRET=your_key_secret_here

# Server Configuration
PORT=3000
NODE_ENV=development

# Frontend URL (for CORS)
FRONTEND_URL=http://127.0.0.1:5500
```

### 5. Start Backend Server
```bash
# Development mode with auto-restart
npm run dev

# Or production mode
npm start
```

Server will run on `http://localhost:3000`

## 🎨 Frontend Setup

### 1. Navigate to Frontend Directory
```bash
cd dreamride-lucky-draw/frontend
```

### 2. Configure EmailJS (Optional)
Edit `buy.html` and replace placeholders:
- `YOUR_EMAILJS_USER_ID`: Your EmailJS user ID
- `YOUR_SERVICE_ID`: Your EmailJS service ID  
- `YOUR_TEMPLATE_ID`: Your EmailJS template ID

### 3. Serve Frontend Files
Use any static file server:

**Option A: Live Server (VS Code Extension)**
- Install Live Server extension
- Right-click `index.html` → "Open with Live Server"

**Option B: Python HTTP Server**
```bash
python -m http.server 5500
```

**Option C: Node.js HTTP Server**
```bash
npx http-server -p 5500
```

Frontend will be available at `http://127.0.0.1:5500`

## 🔧 Razorpay Setup

### 1. Create Razorpay Account
- Visit [Razorpay Dashboard](https://dashboard.razorpay.com/)
- Sign up for a free account
- Complete KYC verification

### 2. Get API Keys
- Go to Settings → API Keys
- Generate Test/Live API keys
- Copy `Key ID` and `Key Secret` to `.env` file

### 3. Test Mode Configuration
For testing, use these test card details:

**Test Cards:**
- **Success**: 4111 1111 1111 1111
- **Failure**: 4000 0000 0000 0002
- **CVV**: Any 3 digits
- **Expiry**: Any future date
- **Name**: Any name

## 📧 EmailJS Setup (Optional)

### 1. Create EmailJS Account
- Visit [EmailJS](https://www.emailjs.com/)
- Sign up for free account

### 2. Configure Email Service
- Add email service (Gmail, Outlook, etc.)
- Create email template with variables:
  - `{{to_name}}`: Recipient name
  - `{{ticket_id}}`: Generated ticket ID
  - `{{payment_id}}`: Razorpay payment ID
  - `{{amount}}`: Ticket amount

### 3. Update Frontend Code
Replace placeholders in `buy.html`:
```javascript
emailjs.init('YOUR_EMAILJS_USER_ID');
await emailjs.send('YOUR_SERVICE_ID', 'YOUR_TEMPLATE_ID', emailParams);
```

## 🧪 Testing the Application

### 1. Test Backend API
```bash
# Health check
curl http://localhost:3000/health

# Create test order
curl -X POST http://localhost:3000/create-order \
  -H "Content-Type: application/json" \
  -d '{"amount": 4900}'
```

### 2. Test Frontend Flow
1. Open `http://127.0.0.1:5500`
2. Navigate through all pages
3. Test ticket purchase with test card
4. Verify email delivery (if configured)

### 3. Test Payment Flow
1. Fill form on buy page
2. Click "Proceed to Payment"
3. Use test card: `4111 1111 1111 1111`
4. Complete payment for ₹99
5. Verify success modal and email

## 🚀 Production Deployment

### Backend Deployment
1. **Environment Variables**: Set production Razorpay keys
2. **HTTPS**: Use SSL certificate for secure payments
3. **CORS**: Update `FRONTEND_URL` to production domain
4. **Database**: Add database for ticket storage (optional)

### Frontend Deployment
1. **CDN**: Host static files on CDN
2. **API URL**: Update `API_BASE_URL` to production backend
3. **EmailJS**: Configure production email templates
4. **Domain**: Use custom domain with SSL

## 🔒 Security Best Practices

- ✅ API keys stored in environment variables
- ✅ CORS configured for specific origins
- ✅ Payment verification using HMAC signatures
- ✅ Input validation on both frontend and backend
- ✅ Error handling without exposing sensitive data
- ✅ HTTPS required for production payments

## 📱 Browser Support

- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+

## 🎯 Key Features Implemented

### Frontend
- ✅ Responsive design with Tailwind CSS
- ✅ Smooth animations and transitions
- ✅ Premium automotive theme
- ✅ Form validation and error handling
- ✅ Payment success/failure handling
- ✅ Email integration for ticket confirmation

### Backend
- ✅ RESTful API with Express.js
- ✅ Razorpay order creation
- ✅ Payment signature verification
- ✅ CORS configuration
- ✅ Environment-based configuration
- ✅ Comprehensive error handling

## 🐛 Troubleshooting

### Common Issues

**1. CORS Error**
- Ensure backend `FRONTEND_URL` matches frontend URL
- Check if backend server is running

**2. Payment Fails**
- Verify Razorpay keys in `.env`
- Check if using test keys with test cards
- Ensure amount is in paise (₹49 = 4900 paise)

**3. Email Not Sending**
- Verify EmailJS configuration
- Check browser console for errors
- Ensure EmailJS service is active

**4. Server Won't Start**
- Check if port 3000 is available
- Verify all dependencies are installed
- Check `.env` file format
- Ensure amount is in paise (₹99 = 9900 paise)

## 📞 Support

For issues or questions:
1. Check browser console for errors
2. Verify all configuration steps
3. Test with provided test data
4. Review server logs for backend issues

## 🎉 Success Criteria

Your application is working correctly when:
- ✅ All pages load without errors
- ✅ Payment flow completes successfully
- ✅ Ticket ID is generated and displayed
- ✅ Email confirmation is sent (if configured)
- ✅ Responsive design works on mobile devices
- ✅ Backend API responds to all endpoints

---

**Built with ❤️ for premium automotive experiences**