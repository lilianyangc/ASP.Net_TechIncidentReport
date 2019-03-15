using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace TechKnowPro.Model
{
    public class Hasher
    {
        string hashedPassword;
        string password;

        public Hasher(string pass)
        {
            password = pass;
        }

        public string getHashedPassword()
        {
            hashedPassword = hashPassword(password);
            return hashedPassword;
        }

        public string hashPassword(string pw)
        {
            SHA256 sha256 = SHA256Managed.Create();
            byte[] bytes = Encoding.UTF8.GetBytes(pw);
            byte[] hash = sha256.ComputeHash(bytes);
            //convert hash to string
            StringBuilder result = new StringBuilder();
            for (int i = 0; i < hash.Length; i++)
            {
                result.Append(hash[i].ToString("X2"));
            }
            //store hash string to session to update database
            return result.ToString();
        }
    }
}