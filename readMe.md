Triggers)

deletion of user deletes driver

    CREATE TRIGGER userDeleteDriver
    AFTER DELETE ON app.User
    FOR EACH ROW
    DELETE FROM app.Driver
    WHERE D.uid = OLD.user_id

deletion of user deletes rider

    CREATE TRIGGER userDeleteRider
    AFTER DELETE ON app.User
    FOR EACH ROW
    DELETE FROM app.Rider R
    WHERE R.uid = OLD.user_id

deletion of car deletes rides associated with it


    CREATE TRIGGER carDelete
    AFTER DELETE ON app.Car
    FOR EACH ROW
    DELETE FROM app.Ride R
    WHERE R.car = OLD.Lincense_Plate


deletion of user deletes ratings with it

    CREATE TRIGGER userDeleteRating
    AFTER DELETE ON app.User
    FOR EACH ROW
    DELETE FROM app.Ratings R
    WHERE R.giver = OLD.user_id or R.reciever = OLD.user_id

deletion of ride deletes rideRequest

    CREATE TRIGGER rideDeleteRideRequest
    AFTER DELETE ON app.Ride
    FOR EACH ROW
    DELETE FROM app.rideRequest R
    WHERE R.ride_offer = OLD.ride_id
