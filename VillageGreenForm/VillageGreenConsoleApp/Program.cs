using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace VillageGreenConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Entrez votre adresse email");
            string adresseEmail = Console.ReadLine();

            Console.WriteLine(CheckMail(adresseEmail)); 
        }


        /// <summary>
        ///Methode pour valider une adresse email.La fonction renvoie une chaîne de caractère vide si l’adresse est correcte, 
        ///ou contenant l’erreur détectée si l’adresse n’est pas cohérente.
        /// </summary>
        /// <param name="eMail"></param>
        /// <returns></returns>
        static string CheckMail(string eMail)
        {
            string result = "";

            if (Regex.IsMatch(eMail, "^([a-zA-Z0-9]{1,}[._-]{0,1}[a-zA-Z0-9]{1,})+@([a-zA-Z0-9]{1,}[._-]{0,1}[a-zA-Z0-9]{1,})+.[a-zA-Z0-9]{2,}$"))
            {
                result = "";
            }
            else if (Regex.IsMatch(eMail, "^[a-zA-Z0-9]{1}@([a-zA-Z0-9]{1,}[._-]{0,1}[a-zA-Z0-9]{1,})+.[a-zA-Z0-9]{2,}$"))
            {
                result = "L'adresse doit comporter au moins deux caractères devant @";
            }
            else if (Regex.IsMatch(eMail, "^([a-zA-Z0-9]{1,}[._-]{0,1}[a-zA-Z0-9]{1,})+@[a-zA-Z0-9]{1}.[a-zA-Z0-9]{2,}$"))
            {
                result = "L'adresse doit comporter au moins deux caractères après @ ";
            }
            else if (Regex.IsMatch(eMail, "^[a-zA-Z0-9]{1}@[a-zA-Z0-9]{1}.[a-zA-Z0-9]{2,}$"))
            {
                result = "L'adresse doit comporter au moins deux caractères devant et après @ ";
            }
            else if (Regex.IsMatch(eMail, "^([a-zA-Z0-9]{1,}[._-]{0,1}[a-zA-Z0-9]{1,})+@([a-zA-Z0-9]{1,}[._-]{0,1}[a-zA-Z0-9]{1,})+.[a-zA-Z0-9]{1}$"))
            {
                result = "L'adresse doit comporter après le point au moins deux caractères";
            }
            else
            {
                result = "Adresse email invalide";
            }
            return result;
        }
    }
}
