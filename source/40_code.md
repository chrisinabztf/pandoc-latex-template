# Code Listings

## Ohne Nix

```java
public class Example implements LoremIpsum {
	public static void main(String[] args) {
		if(args.length < 2) {
			System.out.println("Lorem ipsum dolor sit amet");
		}
	} // Obscura atque coniuge, per de coniunx
}
```

## Mit Label und Caption

```{#lst:code1 .haskell .numberLines caption="Listing caption"}
main :: IO ()
main = putStrLn "Hello World!"
```

## Caption separat

```haskell
main :: IO ()
main = putStrLn "Hello World!"
```

: Listing caption {#lst:code2}