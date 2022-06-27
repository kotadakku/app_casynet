import 'package:app_casynet/app/controller/store_manager/product/add_product_controller.dart';
import 'package:app_casynet/app/views/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../../controller/store_manager/add_product/get_category_controller.dart';
import '../../../../../routes/app_pages.dart';
import 'UI_Chonloaisanpham.dart';



class Themspdv extends StatelessWidget {

  final getdms = Get.put(getdanhmuc());

  Themspdv({Key? key}) : super(key: key);
  final AddProductController _addProductController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Thêm Dịch vụ/ Sản phẩm",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: themspdvs(context),
    );
  }
  Widget themspdvs(BuildContext context) {

    return Stack(
      children: [
        Container(
            color: const Color.fromARGB(255, 241, 243, 253),
            child: Form(
              key: _addProductController.formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  //Them image
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    color: Colors.white,
                    height: 100,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Obx(
                                () => ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _addProductController.imagepicker.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return FutureBuilder(builder: (context, snapshot) {
                                  if(_addProductController.imagepicker[index].toString().contains(".jpg") 
                                      || _addProductController.imagepicker[index].toString().contains(".png")
                                        || _addProductController.imagepicker[index].toString().contains(".jpeg")
                                           ||  _addProductController.imagepicker[index].toString().contains(".gif")
                                  ){
                                    return Row(
                                      children: [
                                        Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 5, left: 5, top: 5),
                                              color: Colors.red,
                                              child: Image.file(
                                                _addProductController.imagepicker[index],
                                                width: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Positioned(
                                              width: 30,
                                              height: 30,
                                              left: 80,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(20.0),
                                                  color: const Color.fromARGB(
                                                      255, 241, 243, 253),
                                                  border: Border.all(
                                                    width: 1,
                                                    style: BorderStyle.solid,
                                                  ),
                                                ),
                                                child: IconButton(
                                                  icon: const Icon(
                                                    Icons.close,
                                                    size: 12,
                                                  ),
                                                  onPressed: () {
                                                    _addProductController.imagepicker.removeAt(index);
                                                  },
                                                ),
                                              ),
                                            )
                                          ],
                                        ),

                                        // Text(x.toString()),
                                      ],
                                    );
                                  }else if(_addProductController.imagepicker[index].toString().contains(".mp4")
                                      || _addProductController.imagepicker[index].toString().contains(".avi")
                                      || _addProductController.imagepicker[index].toString().contains(".mkv")
                                      || _addProductController.imagepicker[index].toString().contains(".vob")
                                      || _addProductController.imagepicker[index].toString().contains(".divx")
                                      || _addProductController.imagepicker[index].toString().contains(".flv")
                                  ){
                                    return Container(

                                      width: 100,
                                      margin: EdgeInsets.symmetric(horizontal: 5.0.w),
                                      child: FutureBuilder(
                                        future: _addProductController.videoControllers[index]?.initialize(),
                                        builder: (context, snapshot) {
                                          return Stack(
                                            children: [
                                              Center(
                                                child: AspectRatio(
                                                  aspectRatio:  _addProductController.videoControllers[index]?.value.aspectRatio??1.6,
                                                  child: VideoPlayer(
                                                    _addProductController.videoControllers[index]!,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                child: Center(
                                                  child: TextButton(
                                                    child: GetBuilder<AddProductController>(
                                                      init: AddProductController(),
                                                      builder: (controller){
                                                        return Icon(controller.videoControllers[index]!.value.isPlaying ? Icons.pause:Icons.play_arrow);
                                                      },
                                                    ),
                                                    onPressed: () {
                                                      _addProductController.onPauseVideo(index);

                                                    },
                                                  ),
                                                )
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    );
                                  }else{
                                    return const Text("cv");
                                  }
                                },
                                );
                              },
                            ),
                          ),
                          Center(
                            child: Container(
                              margin: const EdgeInsets.only(left: 20),
                              width: 110,
                              height: 90,
                              child: OutlinedButton(
                                style: ElevatedButton.styleFrom(
                                  side: const BorderSide(
                                    color: Colors.amber,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Text('add_image'.tr,
                                    maxLines: 2, textAlign: TextAlign.center),
                                onPressed: () {
                                  _addProductController.showActionSheet(context);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Them ten
                  Container(
                    color: Colors.white,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Tên sản phẩm",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Obx(()=>Text(_addProductController.demname.toString() + "/120"),),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.disabled,
                            validator: (value){
                              if(value?.trim()==''){
                                return 'required_field'.tr;
                              }
                            },
                            onSaved: (value){
                              _addProductController.product.name = value;
                            },
                            decoration: const InputDecoration(
                              hintText: "Nhập tên sản phẩm",
                              counterText: "",
                              border: InputBorder.none,
                            ),
                            maxLength: 120,
                            maxLines: 2,
                            controller: _addProductController.name,
                            onChanged: (text) {
                              _addProductController.demname.value = text.length;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Them mo ta
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Mô tả sản phẩm",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(_addProductController.demmotasanpham.toString() + "/3000"),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.disabled,
                            validator: (value){
                              if(value?.trim()==''){
                                return 'required_field'.tr;
                              }
                            },
                            onSaved: (value){
                              _addProductController.product.description = value;
                            },
                            decoration: const InputDecoration(
                              hintText: "Nhập mô tả sản phẩm",
                              counterText: "",
                              border: InputBorder.none,
                            ),
                            maxLength: 3000,
                            maxLines: 2,
                            controller: _addProductController.motasanpham,
                            onChanged: (text) {
                              _addProductController.demmotasanpham.value = text.length;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color.fromRGBO(200, 200, 200, 200),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(right: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Expanded(
                            child: Text("Mã sản phẩm(SKU)"),
                          ),
                          Text("Mã sản phẩm(SKU)"),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color.fromRGBO(200, 200, 200, 200),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(right: 10, left: 10),
                      child: Row(
                        children: [
                          const Expanded(child: Text("Yêu cầu hẹn trước")),
                          Text(_addProductController.isOption.value ? 'Có': 'Không'),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Obx(
                                  () => CupertinoSwitch(
                                value: _addProductController.isOption.value,
                                onChanged: (value) {
                                  _addProductController.isOption.value = !_addProductController.isOption.value;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color.fromRGBO(200, 200, 200, 200),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(right: 10, left: 10),
                      child: Row(
                        children: [
                          const Expanded(child: Text("Số lượng nhập kho")),
                          // Text("0"),
                          Expanded(
                            child: TextField(
                              controller: _addProductController.soluongnhapkho,
                              textDirection: TextDirection.rtl,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              onTap: () {
                                if (_addProductController.soluongnhapkho.text == "0") {
                                  _addProductController.soluongnhapkho.text = "";
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color.fromRGBO(200, 200, 200, 200),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          const Expanded(child: Text("Ngày hết hạn")),
                          OutlinedButton(
                            style: ElevatedButton.styleFrom(
                              side: const BorderSide(color: Colors.white),
                            ),
                            child: Row(
                              children: [
                                Obx(() => Text(_addProductController.date.value.day.toString() +
                                    "/" +
                                    _addProductController.date.value.month.toString() +
                                    "/" +
                                    _addProductController.date.value.year.toString())),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: const ImageIcon(
                                      AssetImage("assets/images/Icon/icon_date.png")),
                                ),
                              ],
                            ),
                            onPressed: () async {
                              DateTime? newdate = await showDatePicker(
                                context: context,
                                initialDate: _addProductController.date.value,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2025),
                              );
                              if (newdate != null) {
                                _addProductController.date.value = newdate;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(
                            color: Color.fromRGBO(200, 200, 200, 200),
                          )),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(right: 10, left: 10),
                      child: Row(
                        children: [
                          Text('price'.tr),
                          Expanded(
                            child: TextFormField(
                              onSaved: (value){
                                if(value?.trim() != '' && int.tryParse(value!) == null){
                                  _addProductController.product.officialPrice = int.parse(value);
                                }
                              },
                              validator: (value){
                                if(value?.trim() != ''){
                                  if(int.tryParse(value!) == null){
                                    return 'Không đúng định dạng';
                                  }
                                }

                              },
                              controller: _addProductController.gia,
                              textDirection: TextDirection.rtl,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                              ),
                              onTap: () {
                                if (_addProductController.gia.text == "0") {
                                  _addProductController.gia.text = "";
                                }
                              },
                            ),
                          ),
                          Expanded(
                            child:  TextFormField(
                              onSaved: (value){
                                if(value?.trim() != '' && int.tryParse(value!) == null){
                                  _addProductController.product.price = int.parse(value);
                                }
                              },
                              validator: (value){
                                if(value?.trim() != ''){
                                  if(int.tryParse(value!) == null){
                                    return 'Không đúng định dạng';
                                  }
                                }

                              },
                              controller: _addProductController.giakhuyenmai,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                fillColor: Colors.red.withOpacity(0.8),
                                filled: true,
                                hintText: "Giá khuyến mại",
                                hintStyle: const TextStyle(color: Colors.white),
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(color: Colors.white),
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color.fromRGBO(200, 200, 200, 200),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(right: 10, left: 10),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text("Số lượng còn lại"),
                          ),
                          Expanded(
                            child: TextFormField(
                              onSaved: (value){
                                if(value?.trim() != '' && int.tryParse(value!) == null){
                                  if(int.parse(value) > 0) {
                                    _addProductController.product.amount = int.parse(value);
                                  }
                                }
                                _addProductController.product.amount = 0;
                              },
                              validator: (value){
                                if(value?.trim() != ''){
                                  if(int.tryParse(value!) == null){
                                    return 'Không đúng định dạng';
                                  }
                                }

                              },
                              controller: _addProductController.soluongconlai,
                              textDirection: TextDirection.rtl,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                border: InputBorder.none,
                                isDense: true,
                              ),
                              onTap: () {
                                if (_addProductController.soluongconlai.text == "0") {
                                  _addProductController.soluongconlai.text = "";
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){

                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color.fromRGBO(200, 200, 200, 200),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                      child: Row(
                        children: const [
                          Expanded(child: Text("Tình trạng kho hàng")),
                          Text("Còn hàng"),
                          Icon(Icons.navigate_next),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      FocusManager.instance.primaryFocus!.unfocus();
                      var value = await Get.toNamed(
                          Routes.STORE_MANAGER_SELECT_CATEGORY,
                        arguments: [_addProductController.listCategorySelected.value]
                      );
                      if(value != null){
                        _addProductController.listCategorySelected.clear();
                        _addProductController.listCategorySelected.addAll(value);
                      }
                    },
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 10.w),
                                child: const Text("Danh mục"),
                              )
                          ),
                          Obx(()=>
                          _addProductController.listCategorySelected.length>0
                              ? Expanded(
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: _addProductController.listCategorySelected.length,
                                  reverse: true,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      alignment: Alignment.centerRight,
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(right: 10, left: 10),
                                            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                                            height: 40,
                                            child: Center(
                                              child: Text(_addProductController.listCategorySelected[index].name
                                                  .toString()),
                                            ),
                                            color:
                                            const Color.fromARGB(255, 241, 243, 253),
                                          ),
                                          Positioned(
                                              width: 20,
                                              height: 20,
                                              right: 0,
                                              top: 0,
                                              child: FloatingActionButton(
                                                heroTag: '${index}',
                                                child: const Icon(Icons.close, size: 8,),
                                                onPressed: (){
                                                  _addProductController.listCategorySelected
                                                      .removeAt(index);
                                                },
                                              )
                                          ),
                                        ],
                                      ),
                                    );
                                  })
                          )
                              : Row(
                            children: const [
                              Text(
                                "Chọn danh mục",
                                textAlign: TextAlign.end,
                              ),
                              Icon(Icons.navigate_next),
                            ],
                          )
                          )
                          // Text("Lựa chọn danh mục"),
                          // Icon(Icons.navigate_next),
                        ],
                      ),
                    )
                  ),
                  InkWell(
                    onTap: (){

                    },
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color.fromRGBO(200, 200, 200, 200),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(child: Text('display'.tr)),
                          const Text("Danh mục, tìm kiếm"),
                          const Icon(Icons.navigate_next),
                        ],
                      ),
                    ),
                  ),


                  InkWell(
                    onTap: () async {
                      var value = await Get.toNamed(Routes.STORE_MANAGER_SELECT_ORIGIN);
                      if(value != null){
                        _addProductController.selectOrigin.value = value;
                      }
                    },
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color.fromRGBO(200, 200, 200, 200),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Expanded(child: Text("Xuất xứ")),
                          Obx(()=> Text('${_addProductController.selectOrigin.value.name??''}'),),
                          const Icon(Icons.navigate_next),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(chonloaisanpham());
                    },

                    child: Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color.fromRGBO(200, 200, 200, 200),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(child: Text('type_product'.tr)),
                          Text(_addProductController.clsp.lsp.toString()),
                          const Icon(Icons.navigate_next),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color.fromRGBO(200, 200, 200, 200),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(right: 10, left: 10),
                      child: Row(
                        children: [
                          const Expanded(child: Text("Hiện thị sản phẩm")),
                          Text(_addProductController.isDisplay.value ? 'Có': 'Không'),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Obx(
                                  () => CupertinoSwitch(
                                value: _addProductController.isDisplay.value,
                                onChanged: (val) {
                                  _addProductController.isDisplay.value = !_addProductController.isDisplay.value;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color.fromRGBO(200, 200, 200, 200),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(right: 10, left: 10),
                      child: Row(
                        children: [
                          const Expanded(child: Text("Hiện thị ở trang chính")),
                          Text(_addProductController.textsthttc.toString()),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Obx(
                                  () => CupertinoSwitch(
                                value: _addProductController.statushttc.value,
                                onChanged: (val) {
                                  _addProductController.statushttc.value = !_addProductController.statushttc.value;
                                  if (_addProductController.statushttc.value == true) {
                                    _addProductController.textsthttc.value = "có";
                                  } else {
                                    _addProductController.textsthttc.value = "không";
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color.fromRGBO(200, 200, 200, 200),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(right: 10, left: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text('featured'.tr),
                          ),
                          Obx(()=>Text(_addProductController.isFeatured.value ? 'có' : 'không'),),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Obx(
                                  () => CupertinoSwitch(
                                value: _addProductController.isFeatured.value,
                                onChanged: (val) {
                                  _addProductController.isFeatured.value = !_addProductController.isFeatured.value;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 5, left: 10),

                            child: ElevatedButton(
                              child: Text('back'.tr),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 10, left: 5),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: Colors.amber),
                              child: Text('save_info'.tr),
                              onPressed: () {
                                _addProductController.saveProduct();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
        ),
        Obx(()=>_addProductController.isLoading.value ? Container(
          color: AppColors.backgroundColor.withOpacity(0.5),
          child: const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        ) : const SizedBox())
      ],
    );
  }
}




class chonloaisp extends GetxController {
  var lsp = "Chọn loại sp".obs;
}




