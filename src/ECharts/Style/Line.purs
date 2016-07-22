module ECharts.Style.Line where

import ECharts.Prelude

import Data.StrMap as SM

import ECharts.Color (Color)

data LineType
  = Solid
  | Dotted
  | Dashed

instance linetypeEncodeJson ∷ EncodeJson LineType where
  encodeJson a = encodeJson $ case a of
    Solid → "solid"
    Dotted → "dotted"
    Dashed → "dashed"

instance linetypeDecodeJson ∷ DecodeJson LineType where
  decodeJson j = do
    str ← decodeJson j
    case str of
      "solid" → pure Solid
      "dotted" → pure Dotted
      "dashed" → pure Dashed
      _ → Left "incorrect line type"

type LineStyleRec =
  { color ∷ Maybe Color
  , "type" ∷ Maybe LineType
  , width ∷ Maybe Number
  , shadowColor ∷ Maybe Color
  , shadowOffsetX ∷ Maybe Number
  , shadowOffsetY ∷ Maybe Number
  }

newtype LineStyle
  = LineStyle LineStyleRec


instance lineStyleEncodeJson ∷ EncodeJson LineStyle where
  encodeJson (LineStyle ls) =
    encodeJson
      $ SM.fromFoldable
        [ "color" := ls.color
        , "type" := ls."type"
        , "width" := ls.width
        , "shadowColor" := ls.shadowColor
        , "shadowOffsetX" := ls.shadowOffsetX
        , "shadowOffsetY" := ls.shadowOffsetY
        ]

instance lineStyleDecodeJson ∷ DecodeJson LineStyle where
  decodeJson j = do
    o ← decodeJson j
    r ← { color: _
        , "type": _
        , width: _
        , shadowColor: _
        , shadowOffsetX: _
        , shadowOffsetY: _ }
        <$> (o .? "color")
        <*> (o .? "type")
        <*> (o .? "width")
        <*> (o .? "shadowColor")
        <*> (o .? "shadowOffsetX")
        <*> (o .? "shadowOffsetY")
    pure $ LineStyle r

lineStyleDefault ∷ LineStyleRec
lineStyleDefault =
  { color: Nothing
  , "type": Nothing
  , width: Nothing
  , shadowColor: Nothing
  , shadowOffsetX: Nothing
  , shadowOffsetY: Nothing
  }
