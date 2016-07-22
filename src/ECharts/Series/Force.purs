module ECharts.Series.Force where

import ECharts.Prelude

import Data.StrMap as SM

import ECharts.Style.Item (ItemStyle)
import ECharts.Symbol (SymbolSize, Symbol)

type ForceCategoryRec =
  { name ∷ Maybe String
  , symbol ∷ Maybe Symbol
  , symbolSize ∷ Maybe SymbolSize
  , itemStyle ∷ Maybe ItemStyle
  }

newtype ForceCategory
  = ForceCategory ForceCategoryRec

forceCategoryDefault ∷ ForceCategoryRec
forceCategoryDefault =
  { name: Nothing
  , symbol: Nothing
  , symbolSize: Nothing
  , itemStyle: Nothing
  }

instance forceCategoryEncodeJson ∷ EncodeJson ForceCategory where
   encodeJson (ForceCategory fc) =
     encodeJson
       $ SM.fromFoldable
           [ "name" := fc.name
           , "symbol" := fc.symbol
           , "symbolSize" := fc.symbolSize
           , "itemStyle" := fc.itemStyle
           ]
instance forceCategoryDecodeJson ∷ DecodeJson ForceCategory where
  decodeJson j = do
    o ← decodeJson j
    r ← { name: _
        , symbol: _
        , symbolSize: _
        , itemStyle: _ }
        <$>  (o .? "name")
        <*> (o .? "symbol")
        <*> (o .? "symbolSize")
        <*> (o .? "itemStyle")
    pure $ ForceCategory r


type NodeRec =
  { name ∷ Maybe String
  , label ∷ Maybe String
  , value ∷ Number
  , ignore ∷ Maybe Boolean
  , symbol ∷ Maybe Symbol
  , symbolSize ∷ Maybe SymbolSize
  , itemStyle ∷ Maybe ItemStyle
  , initial ∷ Maybe (Tuple Number Number)
  , fixX ∷ Maybe Boolean
  , fixY ∷ Maybe Boolean
  , draggable ∷ Maybe Boolean
  , category ∷ Maybe Number
  }


newtype Node = Node NodeRec
nodeDefault ∷ Number → NodeRec
nodeDefault value =
  { name: Nothing
  , label: Nothing
  , value
  , ignore: Nothing
  , symbol: Nothing
  , symbolSize: Nothing
  , itemStyle: Nothing
  , initial: Nothing
  , fixX: Nothing
  , fixY: Nothing
  , draggable: Nothing
  , category: Nothing
  }

instance nodeEncodeJson ∷ EncodeJson Node where
  encodeJson (Node n) =
    encodeJson
      $ SM.fromFoldable
          [ "name" := n.name
          , "label" := n.label
          , "value" := n.value
          , "ignore" := n.ignore
          , "symbol" := n.symbol
          , "symbolSize" := n.symbolSize
          , "itemStyle" := n.itemStyle
          , "initial" := n.initial
          , "fixX" := n.fixX
          , "fixY" := n.fixY
          , "draggable" := n.draggable
          , "category" := n.category
          ]

instance nodeDecodeJson ∷ DecodeJson Node where
  decodeJson j = do
    o ← decodeJson j
    r ← { name: _
        , label: _
        , value: _
        , ignore: _
        , symbol: _
        , symbolSize: _
        , itemStyle: _
        , initial: _
        , fixX: _
        , fixY: _
        , draggable: _
        , category: _ }
        <$> (o .? "name")
        <*> (o .? "label")
        <*> (o .? "value")
        <*> (o .? "ignore")
        <*> (o .? "symbol")
        <*> (o .? "symbolSize")
        <*> (o .? "itemStyle")
        <*> (o .? "initial")
        <*> (o .? "fixX")
        <*> (o .? "fixY")
        <*> (o .? "draggable")
        <*> (o .? "category")
    pure $ Node r

data LinkEnd
  = Name String
  | Index Number

instance linkEndEncodeJson ∷ EncodeJson LinkEnd where
  encodeJson (Name name) = encodeJson name
  encodeJson (Index id) = encodeJson id

instance linkEndDecodeJson ∷ DecodeJson LinkEnd where
  decodeJson j =
    (Name <$> decodeJson j) <|> (Index <$> decodeJson j)

type LinkRec =
  { source ∷ LinkEnd
  , target ∷ LinkEnd
  , weight ∷ Number
  , itemStyle ∷ Maybe ItemStyle
  }

newtype Link
  = Link LinkRec


instance linkEncodeJson ∷ EncodeJson Link where
  encodeJson (Link link) =
    encodeJson
      $ SM.fromFoldable
          [ "source" := link.source
          , "target" := link.target
          , "weight" := link.weight
          , "itemStyle" := link.itemStyle
          ]

instance linkDecodeJson ∷ DecodeJson Link where
  decodeJson j = do
    o ← decodeJson j
    r ← { source: _
        , target: _
        , weight: _
        , itemStyle: _ }
        <$> (o .? "source")
        <*> (o .? "target")
        <*> (o .? "weight")
        <*> (o .? "itemStyle")
    pure $ Link r

type Matrix = Array (Array Number)
