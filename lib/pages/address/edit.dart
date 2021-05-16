import 'package:flutter/material.dart';
import 'package:flutter_shop/api/address.dart';
import 'package:flutter_shop/models/address.dart';
import 'package:flutter_shop/pages/address/region_picker.dart';

import '../../iconfont.dart';

class AddressEditPage extends StatefulWidget {
  final Map? arguments;
  AddressEditPage({Key? key, this.arguments}) : super(key: key);

  @override
  _AddressEditPageState createState() => _AddressEditPageState();
}

class _AddressEditPageState extends State<AddressEditPage> {
  final formKey = GlobalKey<FormState>();
  Address address = Address(0, '', '', 0, '', false);
  TextEditingController? nameController, telController, addressController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    telController = TextEditingController();
    addressController = TextEditingController();
    if (widget.arguments == null || widget.arguments?['id'] == null) {
      return;
    }
    AddressApi.get(widget.arguments?['id'], (res) {
      nameController?.value = TextEditingValue(text: res.name);
      telController?.value = TextEditingValue(text: res.tel);
      addressController?.value = TextEditingValue(text: res.address);
      setState(() {
        address = res;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(IconFont.chevronLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(address.id > 0 ? '修改收货地址' : '新增收货地址'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: '收货人',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '请输入收货人';
                }
                return '';
              },
              onSaved: (newValue) {
                address.name = newValue as String;
              },
            ),
            TextFormField(
              controller: telController,
              decoration: InputDecoration(
                labelText: '手机号',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '请输入手机号';
                }
                return '';
              },
              onSaved: (newValue) => address.tel = newValue as String,
            ),
            InkWell(
              child: Container(
                height: 60,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                ),
                child: showRegion(),
              ),
              onTap: () {
                showRegionPicker(context).then((value) {});
              },
            ),
            TextFormField(
              controller: addressController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                labelText: '详细地址',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '请输入详细地址';
                }
                return '';
              },
              onSaved: (newValue) => address.address = newValue as String,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('设为默认地址'),
                Switch(
                    value: address.isDefault,
                    onChanged: (value) {
                      setState(() {
                        address.isDefault = value;
                      });
                    })
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: () {},
              child: Text('保存'),
            ),
            SizedBox(
              height: 10,
            ),
            address.id > 0
                ? ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xffb4282d)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () {},
                    child: Text('删除'),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget showRegion() {
    if (address.regionId < 1 || address.region == null) {
      return Text(
        '请选择地址',
        style: TextStyle(color: Colors.grey),
      );
    }
    return Text(address.region?.fullName ?? '');
  }
}
