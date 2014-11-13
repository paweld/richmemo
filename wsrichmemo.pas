{
 wsrichmemo.pas 
 
 Author: Dmitry 'skalogryz' Boyarintsev 

 *****************************************************************************
 *                                                                           *
 *  This file is part of the Lazarus Component Library (LCL)                 *
 *                                                                           *
 *  See the file COPYING.modifiedLGPL.txt, included in this distribution,    *
 *  for details about the copyright.                                         *
 *                                                                           *
 *  This program is distributed in the hope that it will be useful,          *
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of           *
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                     *
 *                                                                           *
 *****************************************************************************
}

unit WSRichMemo; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, 

  Graphics, Controls, StdCtrls,
  
  WSStdCtrls;  
  
type

  TIntFontParams = record
    Name    : String;
    Size    : Integer;
    Color   : TColor;
    Style   : TFontStyles;
  end;

const
  AL_LEFT    = 1;
  AL_RIGHT   = 2;
  AL_CENTER  = 3;
  AL_JUSTIFY = 4;

type
  TIntParaMetric = record
    StartIndent : Double; // in points
    EndIndent   : Double; // in points
    Offset      : Double; // in points
    SpaceBefore : Double; // in points
    SpaceAfter  : Double; // in points
    LineSpacing : Double; // todo: ?
  end;

  TParaNumStyle = (pnNone, pnBullet, pnNumber, pnLowLetter
    , pnLowRoman, pnUpLetter, pnUpRoman, pnCustomChar);

  TIntParaNumbering = record
    Numbering   : TParaNumStyle;
    NumCustom   : WideChar;
    NumIndent   : Double;
  end;

  TTabAlignment = (taLeft, taCenter, taRight, taDecimal, taWordBar);

  TTabInfo = record
    Offset : Double;
    Align  : TTabAlignment;
  end;

  TIntParaTabs = record
    Count : Integer;
    Tabs  : array of TTabInfo;
  end;


  { TWSCustomRichMemo }

  TWSCustomRichMemo = class(TWSCustomMemo)
  published
    //Note: RichMemo cannot use LCL TCustomEdit copy/paste/cut operations
    //      because there's no support for (system native) RICHTEXT clipboard format
    //      that's why Clipboard operations are moved to widgetset level
    class procedure CutToClipboard(const AWinControl: TWinControl); virtual;
    class procedure CopyToClipboard(const AWinControl: TWinControl); virtual;
    class procedure PasteFromClipboard(const AWinControl: TWinControl); virtual;
    
    class function GetStyleRange(const AWinControl: TWinControl; TextStart: Integer; var RangeStart, RangeLen: Integer): Boolean; virtual;
    class function GetTextAttributes(const AWinControl: TWinControl; TextStart: Integer;
      var Params: TIntFontParams): Boolean; virtual;
    class procedure SetTextAttributes(const AWinControl: TWinControl; TextStart, TextLen: Integer; 
      const Params: TIntFontParams); virtual;
    class function GetParaAlignment(const AWinControl: TWinControl; TextStart: Integer;
      var AAlign: Integer): Boolean; virtual;
    class procedure SetParaAlignment(const AWinControl: TWinControl; TextStart, TextLen: Integer;
      const AAlign: Integer); virtual;
    class function GetParaMetric(const AWinControl: TWinControl; TextStart: Integer;
      var AMetric: TIntParaMetric): Boolean; virtual;
    class procedure SetParaMetric(const AWinControl: TWinControl; TextStart, TextLen: Integer;
      const AMetric: TIntParaMetric); virtual;
    class procedure SetParaNumbering(const AWinControl: TWinControl; TextStart, TextLen: Integer;
      const ANumber: TIntParaNumbering); virtual;
    class procedure InDelText(const AWinControl: TWinControl; const TextUTF8: String; DstStart, DstLen: Integer); virtual;
    class procedure SetHideSelection(const ACustomEdit: TCustomEdit; AHideSelection: Boolean); override;
    class function LoadRichText(const AWinControl: TWinControl; Source: TStream): Boolean; virtual;
    class function SaveRichText(const AWinControl: TWinControl; Dest: TStream): Boolean; virtual;
  end;
  TWSCustomRichMemoClass = class of TWSCustomRichMemo;

  
function WSRegisterCustomRichMemo: Boolean; external name 'WSRegisterCustomRichMemo';

implementation

{ TWSCustomRichMemo }

class procedure TWSCustomRichMemo.CutToClipboard(const AWinControl: TWinControl); 
begin

end;

class procedure TWSCustomRichMemo.CopyToClipboard(const AWinControl: TWinControl); 
begin

end;

class procedure TWSCustomRichMemo.PasteFromClipboard(const AWinControl: TWinControl); 
begin

end;

class function TWSCustomRichMemo.GetStyleRange(const AWinControl: TWinControl;
  TextStart: Integer; var RangeStart, RangeLen: Integer): Boolean;
begin
  RangeStart :=-1;
  RangeLen := -1;
  Result := false;
end;

class function TWSCustomRichMemo.GetTextAttributes(const AWinControl: TWinControl; 
  TextStart: Integer; var Params: TIntFontParams): Boolean;
begin
  Result := false;
end;

class procedure TWSCustomRichMemo.SetTextAttributes(const AWinControl: TWinControl; 
  TextStart, TextLen: Integer;  
  {Mask: TTextStyleMask;} const Params: TIntFontParams);
begin
end;

class function TWSCustomRichMemo.GetParaAlignment(
  const AWinControl: TWinControl; TextStart: Integer; var AAlign: Integer
  ): Boolean;
begin
  Result := false;
end;

class procedure TWSCustomRichMemo.SetParaAlignment(
  const AWinControl: TWinControl; TextStart, TextLen: Integer; const AAlign: Integer);
begin

end;

class function TWSCustomRichMemo.GetParaMetric(const AWinControl: TWinControl;
  TextStart: Integer; var AMetric: TIntParaMetric): Boolean;
begin
  Result := false;
end;

class procedure TWSCustomRichMemo.SetParaMetric(
  const AWinControl: TWinControl; TextStart, TextLen: Integer;
  const AMetric: TIntParaMetric);
begin

end;

class procedure TWSCustomRichMemo.SetParaNumbering(
  const AWinControl: TWinControl; TextStart, TextLen: Integer;
  const ANumber: TIntParaNumbering);
begin

end;

class procedure TWSCustomRichMemo.InDelText(const AWinControl: TWinControl; const TextUTF8: String; DstStart, DstLen: Integer); 
begin

end;

class procedure TWSCustomRichMemo.SetHideSelection(const ACustomEdit: TCustomEdit; AHideSelection: Boolean); 
begin

end;

class function TWSCustomRichMemo.LoadRichText(const AWinControl: TWinControl; Source: TStream): Boolean;
begin
  Result := false;
end;

class function TWSCustomRichMemo.SaveRichText(const AWinControl: TWinControl; Dest: TStream): Boolean;
begin
  Result := false;
end;

end.

