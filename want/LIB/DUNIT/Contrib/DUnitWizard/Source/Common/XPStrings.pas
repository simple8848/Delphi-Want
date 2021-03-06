unit XPStrings;

{
 $Source: /cvsroot/dunit/dunit/Contrib/DUnitWizard/Source/Common/XPStrings.pas,v $
 $Revision: 1.1 $
 $Date: 2003/07/29 12:54:36 $
 Last amended by $Author: pvspain $
 $State: Exp $

 IXPStrings: interface to surface a TStrings object and provide an iterator

 The requirement for this interface surfaced in the development of the
 EPC Singleton classes. In a nutshell, there was a requirement for a unit-scope
 instance of a TStrings, which was created/destroyed in the respective
 initialization/finalization sections of the unit. However, with interfaced
 objects, it is possible to retain references to objects after their definition
 unit (where their class is declared and defined) has finalised. Any references
 to unit-scope objects in this context will then be invalid.

 By interfacing the unit-scope object (a TStrings) and storing a local
 reference in any objects which use it, the unit-scope object will not be
 destroyed until the last reference is released.

 Copyright (c) 2000, 2003 by Excellent Programming Company ABN 27 005 394 918.
 All rights reserved. This source code is not to be redistributed without
 prior permission from the copyright holder.
 }

interface

uses
  Classes,          // TStrings declaration
  XPIterator;       // IXPDualIterator

////////////////////////////////////////////////////////////////////////////
///          IStringsIface declaration
////////////////////////////////////////////////////////////////////////////

type

  IXPStrings = interface
    ['{9CE27B61-9811-11D4-8C82-0080ADB62643}']
    function Iterator: IXPDualIterator;
    function GetStrings: TStrings;
    property Strings: TStrings read GetStrings;
    end;

function CreateXPStrings(const IsSorted: boolean = false): IXPStrings;

implementation

const CVSID: string = '$Header: /cvsroot/dunit/dunit/Contrib/DUnitWizard/Source/Common/XPStrings.pas,v 1.1 2003/07/29 12:54:36 pvspain Exp $';

//////////////////////////////////////////////////////////////////////////////
//    TIStrings declaration
//////////////////////////////////////////////////////////////////////////////

type

  TIStrings = class(TInterfacedObject, IXPStrings, IXPDualIterator)
    private

    FStrings: TStringList;
    FCurrent: integer;

    protected


    // IXPStrings

    function Iterator: IXPDualIterator;
    function GetStrings: TStrings;

    // IXPDualIterator

    procedure Start;
    procedure Finish;
    function Next(out Element): boolean;
    function Previous(out Element): boolean;

    public

    constructor Create(const IsSorted: Boolean = false);
    destructor Destroy; override;
    end;


//////////////////////////////////////////////////////////////////////////////
//    IXPStrings factory implementation
//////////////////////////////////////////////////////////////////////////////

function CreateXPStrings(const IsSorted: boolean): IXPStrings;
  begin
  Result := TIStrings.Create(IsSorted);
  end;

//////////////////////////////////////////////////////////////////////////////
//    TIStrings implementation
//////////////////////////////////////////////////////////////////////////////

constructor TIStrings.Create(const IsSorted: Boolean);
  begin
  inherited Create;
  FStrings := TStringList.Create;
  FStrings.Sorted := IsSorted;
  end;

destructor TIStrings.Destroy;
  begin
  FStrings.Free;
  inherited;
  end;

procedure TIStrings.Finish;
begin
  // Position beyond end of list
  FCurrent := FStrings.Count;
end;

function TIStrings.GetStrings: TStrings;
  begin
  Result := FStrings;
  end;

function TIStrings.Iterator: IXPDualIterator;
begin
  Result := self;
end;

function TIStrings.Next(out Element): boolean;
begin
  System.Inc(FCurrent);
  Result := (FCurrent >= 0) and (FCurrent < FStrings.Count);

  if Result then
    string(Element) := FStrings[FCurrent];

end;

function TIStrings.Previous(out Element): boolean;
begin
  System.Dec(FCurrent);
  Result := (FCurrent >= 0) and (FCurrent < FStrings.Count);

  if Result then
    string(Element) := FStrings[FCurrent];

end;

procedure TIStrings.Start;
begin
  // Position before beginning of list
  FCurrent := -1;
end;

end.

