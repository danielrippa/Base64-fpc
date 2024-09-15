unit Win32Crypt;

interface

  const
    dll = 'crypt32.dll';

  function CryptBinaryToStringA(pbBinary: Pointer; cbBinary: DWORD; dwFlags: DWORD; pszString: PChar; var pcchString: DWORD): Boolean; stdcall; external dll;

implementation

end.