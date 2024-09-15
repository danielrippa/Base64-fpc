unit Base64;

{$mode delphi}

interface

  function EncodeBase64(AToEncode: String): String;

implementation

  uses
    Win32Crypt, Win32CryptTypes;

  function Encode(AToEncode: PChar; ALength: DWORD; out ResultLength: DWORD): PChar;
  var
    Flags: DWORD;
  begin
    Flags := CRYPT_STRING_BASE64 or CRYPT_STRING_NOCRLF;
    CryptBinaryToStringA(AToEncode, ALength, Flags, Nil, ResultLength);
    getmem(Result, ResultLength);
    CryptBinaryToStringA(AToEncode, ALength, Flags, Pointer(Result), ResultLength);
  end;

  function EncodeBase64;
  var
    Buffer: Pointer;
    Size: DWORD;
    Encoded: String;
  begin
    Buffer := Encode(@AToEncode[1], Length(AToEncode), Size);
    SetLength(Encoded, Size);
    Move(Buffer^, Encoded[1], Size);
    FreeMem(Buffer, Size);

    Result := Copy(Encoded, 42, Length(Encoded) - 81);
    // Result := Encoded;
  end;

end.