# haskell-cleanarchitecture
### 構成図
UseCase層からGateways層のRepository呼び出しは依存の向きが逆転しているのでデータクラスをUseCase層で持たせ、Repositoryで実装させたかったがうまくいかなかった。
![](https://user-images.githubusercontent.com/43517870/75620578-c2a15e00-5bcd-11ea-9f9a-28214d3e6776.png)

### 起動

```
# build
> stack build
# run
> stack exec clean-architecture-exe
```



