using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BehinFlex.Classes;
using BehinFlex.Models;
using BehinFlex.SmsWebService;


namespace BehinFlex.SmsService
{
    public class SmsService
    {
        public PublicJsonResult SendSms(SmsInput input)
        {

            TrezSmsService smsService = new TrezSmsService();
            var numbers = input.Receivers.Split(',').ToList();
            long[] usermessageid = new long[numbers.Count];

            Random random = new Random();

            for (int i = 0; i < numbers.Count; i++)
            {
                usermessageid[i] = LongRandom(min: 0, max: 100000000000000000, rand: new Random());
            }
            var numberArray = numbers.ToArray();
            int smsType = input.SmsType == SmsType.Standard ? 1 : 0;
            //985000299557479
            //irandrip9400030
            var msgIds = smsService.SendMessage("", "", "", input.Body, numberArray, smsType, usermessageid);
            long result = msgIds[0];
            if (result >= 1000 || result == 2)
            {
                return new PublicJsonResult { result = true, message = "ارسال پیام موفق بود" };
            }
            else if (result == 8)
            {
                return new PublicJsonResult { result = false, message = "اطلاعات كاربري نادرست مي باشد.." };
            }
            else if (result == 7)
            {
                return new PublicJsonResult { result = false, message = "تعداد پيام )گيرندگان( بيش از حد مجاز مي باشد" };
            }
            else if (result == 6)
            {
                return new PublicJsonResult { result = false, message = "اطلاعات كاربري شما دستكاري شده است" };

            }
            else if (result == 5)
            {
                return new PublicJsonResult { result = false, message = "بيش از 4 پيام )طول پيام ازحد مجاز بيشتر است(" };

            }
            else if (result == 4)
            {
                return new PublicJsonResult { result = false, message = "شارژ شما کافی نیست" };

            }

            else if (result == 0 || result == 3)
            {
                return new PublicJsonResult { result = false, message = "ارسال پیام ناموفق بود" };
            }
            else
            {
                return new PublicJsonResult { result = false, message = "خطای ناشناخته ای رخ داد" };
            }
        }

        public int GetCredit()
        {
            TrezSmsService smsService = new TrezSmsService();
            long credit=smsService.GetCredit("", "", "");
            if (credit == -1)
            {
                return 0;
            }
            else

            {
                return Convert.ToInt32(credit);
            }

        }


        /// <summary>
        //متدی برای تولید اعداد لانگ   
        /// </summary>
        private long LongRandom(long min, long max, Random rand)
        {
            long result = rand.Next((Int32)(min >> 32), (Int32)(max >> 32));
            result = (result << 32);
            result = result | (long)rand.Next((Int32)min, (Int32)max);
            return result;
        }
    }
}