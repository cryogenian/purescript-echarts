## Module ECharts.Loading

#### `LoadingEffect`

``` purescript
data LoadingEffect
  = Spin
  | Bar
  | Ring
  | Whirling
  | DynamicLine
  | Bubble
```

##### Instances
``` purescript
EncodeJson LoadingEffect
```

#### `LoadingOptionRec`

``` purescript
type LoadingOptionRec = { text :: Maybe String, x :: Maybe XPos, y :: Maybe YPos, textStyle :: Maybe TextStyle, effect :: Maybe LoadingEffect, effectOption :: Maybe Json, progress :: Maybe Number }
```

#### `LoadingOption`

``` purescript
newtype LoadingOption
  = LoadingOption LoadingOptionRec
```

##### Instances
``` purescript
EncodeJson LoadingOption
```

#### `showLoading`

``` purescript
showLoading :: forall e. LoadingOption -> EChart -> Eff (echarts :: ECHARTS | e) EChart
```

#### `hideLoading`

``` purescript
hideLoading :: forall e. EChart -> Eff (echarts :: ECHARTS | e) EChart
```

#### `loadingOptionDefault`

``` purescript
loadingOptionDefault :: LoadingOptionRec
```


