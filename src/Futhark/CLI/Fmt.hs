-- | @futhark fmt@
module Futhark.CLI.Fmt (main) where

import Data.Text.IO qualified as T
import Futhark.Fmt.Printer
import Futhark.Util.Options
import Futhark.Util.Pretty (hPutDoc, putDoc)
import Language.Futhark
import Language.Futhark.Parser (SyntaxError (..))
import System.Exit
import System.IO

-- | Run @futhark fmt@.
main :: String -> [String] -> IO ()
main = mainWithOptions () [] "program" $ \args () ->
  case args of
    [] -> Just $ putDoc =<< onInput =<< T.getContents
    [file] ->
      Just $ do
        doc <- onInput =<< T.readFile file
        withFile file WriteMode $ \h ->
          hPutDoc h doc
    _any -> Nothing
  where
    onInput s = do
      case fmtToDoc "<stdin>" s of
        Left (SyntaxError loc err) -> do
          T.hPutStr stderr $ locText loc <> ":\n" <> prettyText err
          exitFailure
        Right fmt -> pure fmt
