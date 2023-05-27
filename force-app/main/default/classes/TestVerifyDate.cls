@isTest
private class TestVerifyDate {
    @isTest static void testCheckDatesTrue() {
        Date date1 = Date.newInstance(2023, 1, 1);
        Date date2 = Date.newInstance(2023, 1, 2);
        Date result = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(date2, result);
    }

    @isTest static void testCheckDatesFalseDate1OverData2() {
        // date1 > date2
        Date date1 = Date.newInstance(2023, 1, 2);
        Date date2 = Date.newInstance(2023, 1, 1);
        Date result = VerifyDate.CheckDates(date1, date2);
        Date expDate = Date.newInstance(date1.year(), date1.month(), Date.daysInMonth(date1.year(), date1.month()));
        System.assertEquals(expDate, result);
    }

    @isTest static void testCheckDatesFalseDate1LessData2() {
        // date1 < date2 and date1 >= date2 + 30
        Date date1 = Date.newInstance(2023, 1, 1);
        Date date2 = Date.newInstance(2023, 10, 2);
        Date result = VerifyDate.CheckDates(date1, date2);
        Date expDate = Date.newInstance(date1.year(), date1.month(), Date.daysInMonth(date1.year(), date1.month()));
        System.assertEquals(expDate, result);
    }
}