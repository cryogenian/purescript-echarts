module ECharts.Image
  ( ImgType(..)
  , getDataURL
  , getImage
  ) where

import Prelude

import DOM
import DOM.Node.Types
import Control.Monad.Eff
import Data.Function
import Data.Argonaut.Encode
import Data.Argonaut.Decode
import Data.Either

import ECharts.Chart
import ECharts.Effects

data ImgType
  = PNG
  | JPEG

imgStr ∷ ImgType → String
imgStr = case _ of
  PNG → "png"
  JPEG → "jpeg"

instance encodeImg ∷ EncodeJson ImgType where
  encodeJson = encodeJson <<< imgStr

instance decodeImg ∷ DecodeJson ImgType where
  decodeJson j = do
    str ← decodeJson j
    case str of
      "png" → pure PNG
      "jpeg" → pure JPEG
      _ → Left "incorrect img type"

foreign import getDataURLImpl ∷ ∀ e. Fn2 String EChart (Eff e String)

getDataURL ∷ ∀ e. ImgType → EChart → Eff (echarts ∷ ECHARTS|e) String
getDataURL img chart = runFn2 getDataURLImpl (imgStr img) chart


foreign import getImageImpl ∷ ∀ e. Fn2 String EChart (Eff e Node)

getImage ∷ ∀ e. ImgType → EChart → Eff (dom ∷ DOM, echarts ∷ ECHARTS|e) Node
getImage img chart = runFn2 getImageImpl (imgStr img) chart
