using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace Kairos.Util
{
    public class Crypto
    {
        private static byte[] bIV = { 0x88, 0xd, 0xFF, 0x34, 0xED, 0xC5, 0x5C, 0x90, 0x78, 0x4B, 0x9, 0xBA, 0x37, 0x94, 0xEB, 0x7B };
        private const string cryptoKey = "A2E7CD9DE96D40C99F6D873BB974FC32";

        public static string Encrypt(string text)
        {
            try
            {
                if (string.IsNullOrEmpty(text))
                    return "";
                
                byte[] bKey = Convert.FromBase64String(cryptoKey);
                byte[] bText = new UTF8Encoding().GetBytes(text);

                Rijndael rijndael = new RijndaelManaged();
                // 128 (16 caracteres), 192 (24 caracteres) e 256 (32 caracteres)                
                rijndael.KeySize = 256;

                MemoryStream mStream = new MemoryStream();
                CryptoStream encryptor = new CryptoStream(mStream,
                                                          rijndael.CreateEncryptor(bKey, bIV),
                                                          CryptoStreamMode.Write);

                encryptor.Write(bText, 0, bText.Length);
                encryptor.FlushFinalBlock();
                return Convert.ToBase64String(mStream.ToArray());
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Erro ao criptografar", ex);
            }
        }

        public static string Decrypt(string text)
        {
            try
            {
                if (string.IsNullOrEmpty(text))
                    return "";

                byte[] bKey = Convert.FromBase64String(cryptoKey);
                byte[] bText = Convert.FromBase64String(text);

                Rijndael rijndael = new RijndaelManaged();
                rijndael.KeySize = 256;
                MemoryStream mStream = new MemoryStream();
                CryptoStream decryptor = new CryptoStream(mStream,
                                                          rijndael.CreateDecryptor(bKey, bIV),
                                                          CryptoStreamMode.Write);

                decryptor.Write(bText, 0, bText.Length);
                decryptor.FlushFinalBlock();
                UTF8Encoding utf8 = new UTF8Encoding();
                return utf8.GetString(mStream.ToArray());
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Erro ao descriptografar", ex);
            }
        }
    }
}
