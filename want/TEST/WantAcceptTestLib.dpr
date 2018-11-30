{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
{                                              }
{   \\\                                        }
{  -(j)-                                       }
{    /juanca (R)                               }
{    ~                                         }
{     Copyright (C) 1995,2001 Juancarlo Añez   }
{     All rights reserved.                     }
{            http://www.suigeneris.org/juanca  }
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}

{#(@)$Id: WantAcceptTestLib.dpr,v 1.13 2004/05/08 16:15:24 juanco Exp $}

library WantAcceptTestLib;

uses
  ShareMem,
  TestFramework,
  Win32Implementations in '..\src\win32\Win32Implementations.pas',
  ExternalTests in 'ExternalTests.pas',
  ConsoleScriptRunner in '..\src\win32\ConsoleScriptRunner.pas',
  RunnerTests in 'RunnerTests.pas';

{$R *.RES}

exports
  RegisteredTests name 'Test';
end.

