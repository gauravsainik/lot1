# DreamRide Lucky Draw - Testing Guide

## 🧪 Pre-Launch Testing Checklist

### Backend API Testing

#### 1. Health Check
```bash
curl http://localhost:3000/health
```
**Expected Response:**
```json
{
  "status": "Server is running",
  "timestamp": "2024-01-01T00:00:00.000Z"
}
```

#### 2. Create Order Endpoint
```bash
curl -X POST http://localhost:3000/create-order \
  -H "Content-Type: application/json" \
  -d '{"amount": 4900}'
```
**Expected Response:**
```json
{
  "success": true,
  "order_id": "order_xxxxxxxxxxxxx",
  "amount": 4900,
  "currency": "INR",
  "key_id": "rzp_test_xxxxxxxxxxxxx"
}
```

#### 3. Payment Verification (Optional)
```bash
curl -X POST http://localhost:3000/verify-payment \
  -H "Content-Type: application/json" \
  -d '{
    "razorpay_order_id": "order_xxxxxxxxxxxxx",
    "razorpay_payment_id": "pay_xxxxxxxxxxxxx",
    "razorpay_signature": "test_signature"
  }'
```

### Frontend Testing

#### 1. Homepage (index.html)
- [ ] Page loads without errors
- [ ] Navigation menu works
- [ ] Hero section displays correctly
- [ ] Bike variants section shows all 4 colors
- [ ] "Buy Ticket Now" button links to buy.html
- [ ] "View Results" button links to result.html
- [ ] Smooth scrolling animations work
- [ ] Responsive design on mobile devices

#### 2. Buy Page (buy.html)
- [ ] Form validation works for all fields
- [ ] Email format validation
- [ ] Phone number accepts only digits
- [ ] "Proceed to Payment" button is functional
- [ ] Loading state shows during payment processing
- [ ] Success modal appears after payment
- [ ] Ticket ID is generated and displayed
- [ ] Email integration works (if configured)

#### 3. Results Page (result.html)
- [ ] Countdown timer updates every second
- [ ] Prize showcase displays correctly
- [ ] "Buy Ticket Now" button works
- [ ] "Check My Ticket" modal opens
- [ ] Ticket verification accepts valid format (TKTxxxxx)
- [ ] Invalid ticket IDs show error message

### Payment Flow Testing

#### Test Card Details
Use these Razorpay test cards:

**Successful Payment:**
- Card: `4111 1111 1111 1111`
- CVV: `123`
- Expiry: `12/25`
- Name: `Test User`

**Failed Payment:**
- Card: `4000 0000 0000 0002`
- CVV: `123`
- Expiry: `12/25`
- Name: `Test User`

#### Payment Test Steps
1. Fill out the form on buy.html
2. Click "Proceed to Payment"
3. Razorpay popup should open
4. Enter test card details
5. Complete payment
6. Verify success modal shows
7. Check ticket ID format (TKTxxxxx)
8. Verify email is sent (if configured)

### Cross-Browser Testing

Test on the following browsers:
- [ ] Chrome (latest)
- [ ] Firefox (latest)
- [ ] Safari (latest)
- [ ] Edge (latest)

### Mobile Responsiveness

Test on different screen sizes:
- [ ] Mobile (320px - 768px)
- [ ] Tablet (768px - 1024px)
- [ ] Desktop (1024px+)

### Performance Testing

#### Page Load Speed
- [ ] Homepage loads in < 3 seconds
- [ ] Buy page loads in < 3 seconds
- [ ] Results page loads in < 3 seconds

#### Image Optimization
- [ ] All images load properly
- [ ] No broken image links
- [ ] Images are appropriately sized

### Security Testing

#### Frontend Security
- [ ] No sensitive data in client-side code
- [ ] Form validation prevents XSS
- [ ] HTTPS required for production

#### Backend Security
- [ ] API keys stored in environment variables
- [ ] CORS configured correctly
- [ ] Payment verification uses HMAC
- [ ] Error messages don't expose sensitive data

### Email Testing (If Configured)

#### EmailJS Integration
- [ ] Email service is configured
- [ ] Template includes all required variables
- [ ] Emails are delivered successfully
- [ ] Email content is properly formatted
- [ ] Unsubscribe link works (if included)

### Error Handling Testing

#### Network Errors
- [ ] Backend server offline
- [ ] Invalid API responses
- [ ] Payment gateway errors
- [ ] Email service failures

#### User Input Errors
- [ ] Empty form submission
- [ ] Invalid email format
- [ ] Invalid phone number
- [ ] Special characters in name field

### Load Testing (Optional)

#### Concurrent Users
- [ ] 10 simultaneous users
- [ ] 50 simultaneous users
- [ ] 100 simultaneous users

#### Payment Processing
- [ ] Multiple concurrent payments
- [ ] Payment timeout handling
- [ ] Duplicate payment prevention

## 🚀 Production Deployment Checklist

### Environment Configuration
- [ ] Production Razorpay keys configured
- [ ] HTTPS enabled for all pages
- [ ] Production EmailJS service configured
- [ ] CORS updated for production domain
- [ ] Environment variables secured

### Domain and SSL
- [ ] Custom domain configured
- [ ] SSL certificate installed
- [ ] HTTP redirects to HTTPS
- [ ] All external resources use HTTPS

### Monitoring and Analytics
- [ ] Error logging configured
- [ ] Payment success/failure tracking
- [ ] User analytics (optional)
- [ ] Performance monitoring

### Backup and Recovery
- [ ] Database backup strategy (if applicable)
- [ ] Code repository backup
- [ ] Environment configuration backup
- [ ] Recovery procedures documented

## 🐛 Common Issues and Solutions

### Payment Issues
**Issue:** Razorpay popup doesn't open
**Solution:** Check API keys and network connectivity

**Issue:** Payment succeeds but no confirmation
**Solution:** Verify payment handler and success callback

### Email Issues
**Issue:** Emails not being sent
**Solution:** Check EmailJS configuration and service status

**Issue:** Email template not rendering
**Solution:** Verify template variables and HTML structure

### Server Issues
**Issue:** CORS errors
**Solution:** Update FRONTEND_URL in .env file

**Issue:** Server won't start
**Solution:** Check port availability and dependencies

### Frontend Issues
**Issue:** Styles not loading
**Solution:** Verify Tailwind CDN link and internet connection

**Issue:** JavaScript errors
**Solution:** Check browser console and fix syntax errors

## 📊 Success Metrics

### Technical Metrics
- [ ] 99%+ uptime
- [ ] < 3 second page load times
- [ ] < 1% payment failure rate
- [ ] 100% email delivery rate

### User Experience Metrics
- [ ] < 5% form abandonment rate
- [ ] > 90% payment completion rate
- [ ] < 2% support tickets
- [ ] Positive user feedback

---

**Testing completed successfully? You're ready to launch! 🚀**