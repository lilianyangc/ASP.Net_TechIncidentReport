using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TechKnowPro.Model
{
    public class PasswordValidator
    {
        bool valid;

        public PasswordValidator(string password)
        {
            valid = validate(password);
        }

        public bool isValid() { return valid; }

        //Validates if the password entered has atleast 1 uppercase and 1 special character
        protected bool validate(string password)
        {
            if (password.Any(char.IsUpper) && hasSpecialChar(password))
            {
                return true;
            }
            return false;
        }

        //Returns true if it has a special character
        public static bool hasSpecialChar(string input)
        {
            string specialChar = @"\|!#$%&/()=?»«@£§€{}.-;'<>_,";
            foreach (var item in specialChar)
            {
                if (input.Contains(item)) return true;
            }
            return false;
        }
    }
}