import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/models/response/auth/region_model.dart';
class WidgetBottomSheetRegion extends StatefulWidget {
  const WidgetBottomSheetRegion({Key? ke,this.callback}) : super(key: ke);
  final Function(RegionModel region)? callback;

  @override
  State<WidgetBottomSheetRegion> createState() => _WidgetBottomSheetState();
}
class _WidgetBottomSheetState extends State<WidgetBottomSheetRegion> {
  var regionList=<RegionModel>[];
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text("Viloyatlar",style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold),),
          ),
          SizedBox(height:15 ,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(controller: TextEditingController(),
              cursorColor: Colors.red,
              enableInteractiveSelection:true,

              style: TextStyle(fontSize: 15.5),
              decoration: InputDecoration(
                hintText: "Viloyatlar",
                suffixIcon: Icon(Icons.search,color: Colors.black,),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: BorderSide(
                    color: Color(0xff626262),
                    width: 2.0,
                  ),
                ),
                hintStyle: TextStyle(fontSize: 15.5,color: Color(0xff878787)),
                border:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 19),
              ),
            ),
          ),
          Expanded(
            child: Builder(
                builder: (context) {

                    return ListView.builder(
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Color(0xff838383)))),
                          child: InkWell(
                            onTap: () {
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 20, top: 18, bottom: 18),
                              width: double.infinity,
                              child: Text("qweqwe",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                            ),
                          ),
                        );

                      },);


                }
            ),
          )
        ],),
    );
  }
}