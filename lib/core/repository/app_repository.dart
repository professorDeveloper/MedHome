import 'package:medhome/core/models/local/choose_family_model.dart';
import 'package:medhome/utils/my_enum.dart';

List<FamilyChooseModel> familyChooseList(){
  var list=<FamilyChooseModel>[];
  list.add(FamilyChooseModel(title: "Turmush o’rtog’", type: FamilyTypes.WifeOrHusband));
  list.add(FamilyChooseModel(title: "Ota-ona’", type: FamilyTypes.Parents));
  list.add(FamilyChooseModel(title: "Bobo-buvi’", type: FamilyTypes.GrandParents));
  list.add(FamilyChooseModel(title: "Aka-uka’", type: FamilyTypes.Brother));
  list.add(FamilyChooseModel(title: "Opa-singil’", type: FamilyTypes.Sister));
  return list;
}

