<?php

namespace frontend\models;

use Yii;
use frontend\models\News;

/**
 * This is the model class for table "{{%category}}".
 *
 * @property integer $id
 * @property string $name
 * @property string $description
 * @property integer $pid
 * @property integer $sort
 * @property integer $created_at
 * @property integer $updated_at
 */
class Category extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%category}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'description', 'pid', 'sort', 'created_at', 'updated_at'], 'required'],
            [['pid', 'sort', 'created_at', 'updated_at'], 'integer'],
            [['name', 'description'], 'string', 'max' => 64],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'description' => Yii::t('app', 'Description'),
            'pid' => Yii::t('app', 'Pid'),
            'sort' => Yii::t('app', 'Sort'),
            'created_at' => Yii::t('app', 'Created At'),
            'updated_at' => Yii::t('app', 'Updated At'),
        ];
    }

    /**
     * @inheritdoc
     * @return WyCategoryQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new CategoryQuery(get_called_class());
    }

    public function getNewses($name = '经济')
    {
        return $this->hasMany(News::className(), ['category_id' => 'id'])
            ->where('title = :title', [':title' => $name]);
    }

    public static function test()
    {
        $category = Category::find()->one()->getNewses()->createCommand()->sql;
        //$news = $category->newses;
        echo '<pre>';var_dump($category);
    }
}
