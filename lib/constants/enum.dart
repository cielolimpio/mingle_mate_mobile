
enum Gender{
  MALE('Male', '남자'),
  FEMALE('Female', '여자');

  final String engName;
  final String korName;

  const Gender(this.engName, this.korName);
}

enum Period{
  PERIODIC("Periodic", "주기적"),
  FREE('Free', "자유롭게"),
  NOMATTER('NoMatter', "상관없음");

  final String engName;
  final String korName;

  const Period(this.engName, this.korName);
}