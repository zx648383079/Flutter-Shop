part of '../utils/index.dart';

const IS_DEV = false;

const BASIC_HOST = IS_DEV ? 'http://<测试网址>' : 'https://<正式网址>';

const apiEndpoint = BASIC_HOST + '/open/';
const assetUri = BASIC_HOST;
const appId = '<App ID>';
const secret = '<App Secret>';
