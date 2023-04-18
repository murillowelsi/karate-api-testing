package features.bookings;

import com.intuit.karate.junit5.Karate;

public class BookingsRunnerTest {
    @Karate.Test
    public Karate createBooking() {
        return Karate.run("classpath:../features/bookings/create-booking.feature");
    }

    @Karate.Test
    public Karate getAllBookings() {
        return Karate.run("classpath:../features/bookings/get-all-bookings.feature");
    }

    @Karate.Test
    public Karate getBookingById() {
        return Karate.run("classpath:../features/bookings/get-booking-by-id.feature");
    }
}
