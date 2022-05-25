class FollowedConvert{

  String followedConvert(int? followed){
    if(followed != null){
      if(followed >= 10000000000){
        return (followed/10000000000).toStringAsFixed(2)+'b';
      }

      if(followed >= 1000000){
        return (followed/1000000).toStringAsFixed(2)+'m';
      }
      if(followed >= 1000){
        return (followed/1000).toStringAsFixed(2)+'k';
      }
      return followed.toString();
    }
    return '0';
  }
}