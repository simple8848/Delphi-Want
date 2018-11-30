{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
{                                              }
{   \\\                                        }
{  -(j)-                                       }
{    /juanca ®                                 }
{    ~                                         }
{  Copyright © 1995-2002 Juancarlo Añez        }
{  http://www.suigeneris.org/juanca            }
{  All rights reserved.                        }
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}

{#(@)$Id: JALTestLib.dpr,v 1.1 2003/02/21 20:28:44 juanco Exp $}

library JALTestLib;
uses
  SysUtils,
  Classes,
  TestFramework,
  JalMessages,
  ExpressionTests in 'ExpressionTests.pas',
  JalUTM in '..\src\JalUTM.pas',
  JALCollections in '..\src\JALCollections.pas';

exports
  RegisteredTests name 'Test';

begin
  JalMessages.PushMessageHandler(JalMessages.TNullMessageHandler.Create);
end.
