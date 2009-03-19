{-# OPTIONS -fglasgow-exts #-}
module TH_tf2 where

import Language.Haskell.TH

$( [d| class C a where
         data T a
         foo :: Bool -> T a |] )

$( [d| instance C Int where
         data T Int = TInt Bool 
         foo b = TInt (b && b) |] )

$( [d| instance C Float where
         data T Float = TFloat {flag :: Bool}
         foo b = TFloat {flag = b && b} |] )

$( [d| class D a where
         type S a 
         bar :: S a -> Int |] )

$( [d| instance D Int where
         type S Int = Bool 
         bar c = if c then 1 else 2 |] )
