// This file is generated. 
// Edit platform/darwin/scripts/generate-style-code.js, then run `make style-code-darwin`.

#import "MGLSource.h"
#import "MGLMapView_Private.h"
#import "NSPredicate+MGLAdditions.h"
#import "MGLStyleLayer_Private.h"
#import "MGLStyleValue_Private.h"
#import "MGLCircleStyleLayer.h"

#include <mbgl/style/layers/circle_layer.hpp>
namespace mbgl {

    MBGL_DEFINE_ENUM(MGLCirclePitchScale, {
        { MGLCirclePitchScaleMap, "map" },
        { MGLCirclePitchScaleViewport, "viewport" },
    });

    MBGL_DEFINE_ENUM(MGLCircleTranslateAnchor, {
        { MGLCircleTranslateAnchorMap, "map" },
        { MGLCircleTranslateAnchorViewport, "viewport" },
    });

}

@interface MGLCircleStyleLayer ()

@property (nonatomic) mbgl::style::CircleLayer *rawLayer;

@end

@implementation MGLCircleStyleLayer
{
    std::unique_ptr<mbgl::style::CircleLayer> _pendingLayer;
}

- (instancetype)initWithIdentifier:(NSString *)identifier source:(MGLSource *)source
{
    if (self = [super initWithIdentifier:identifier source:source]) {
        auto layer = std::make_unique<mbgl::style::CircleLayer>(identifier.UTF8String, source.identifier.UTF8String);
        _pendingLayer = std::move(layer);
        self.rawLayer = _pendingLayer.get();
    }
    return self;
}

- (mbgl::style::CircleLayer *)rawLayer
{
    return (mbgl::style::CircleLayer *)super.rawLayer;
}

- (void)setRawLayer:(mbgl::style::CircleLayer *)rawLayer
{
    super.rawLayer = rawLayer;
}

- (NSString *)sourceLayerIdentifier
{
    MGLAssertStyleLayerIsValid();

    auto layerID = self.rawLayer->getSourceLayer();
    return layerID.empty() ? nil : @(layerID.c_str());
}

- (void)setSourceLayerIdentifier:(NSString *)sourceLayerIdentifier
{
    MGLAssertStyleLayerIsValid();

    self.rawLayer->setSourceLayer(sourceLayerIdentifier.UTF8String ?: "");
}

- (void)setPredicate:(NSPredicate *)predicate
{
    MGLAssertStyleLayerIsValid();

    self.rawLayer->setFilter(predicate.mgl_filter);
}

- (NSPredicate *)predicate
{
    MGLAssertStyleLayerIsValid();

    return [NSPredicate mgl_predicateWithFilter:self.rawLayer->getFilter()];
}

#pragma mark - Adding to and removing from a map view

- (void)addToMapView:(MGLMapView *)mapView belowLayer:(MGLStyleLayer *)otherLayer
{
    if (_pendingLayer == nullptr) {
        [NSException raise:@"MGLRedundantLayerException"
            format:@"This instance %@ was already added to %@. Adding the same layer instance " \
                    "to the style more than once is invalid.", self, mapView.style];
    }

    if (otherLayer) {
        const mbgl::optional<std::string> belowLayerId{otherLayer.identifier.UTF8String};
        mapView.mbglMap->addLayer(std::move(_pendingLayer), belowLayerId);
    } else {
        mapView.mbglMap->addLayer(std::move(_pendingLayer));
    }
}

- (void)removeFromMapView:(MGLMapView *)mapView
{
    _pendingLayer = nullptr;
    self.rawLayer = nullptr;

    auto removedLayer = mapView.mbglMap->removeLayer(self.identifier.UTF8String);
    if (!removedLayer) {
        return;
    }

    mbgl::style::CircleLayer *layer = dynamic_cast<mbgl::style::CircleLayer *>(removedLayer.get());
    if (!layer) {
        return;
    }

    removedLayer.release();

    _pendingLayer = std::unique_ptr<mbgl::style::CircleLayer>(layer);
    self.rawLayer = _pendingLayer.get();
}

#pragma mark - Accessing the Paint Attributes

- (void)setCircleBlur:(MGLStyleValue<NSNumber *> *)circleBlur {
    MGLAssertStyleLayerIsValid();

    auto mbglValue = MGLStyleValueTransformer<float, NSNumber *>().toPropertyValue(circleBlur);
    self.rawLayer->setCircleBlur(mbglValue);
}

- (MGLStyleValue<NSNumber *> *)circleBlur {
    MGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getCircleBlur() ?: self.rawLayer->getDefaultCircleBlur();
    return MGLStyleValueTransformer<float, NSNumber *>().toStyleValue(propertyValue);
}

- (void)setCircleColor:(MGLStyleValue<MGLColor *> *)circleColor {
    MGLAssertStyleLayerIsValid();

    auto mbglValue = MGLStyleValueTransformer<mbgl::Color, MGLColor *>().toPropertyValue(circleColor);
    self.rawLayer->setCircleColor(mbglValue);
}

- (MGLStyleValue<MGLColor *> *)circleColor {
    MGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getCircleColor() ?: self.rawLayer->getDefaultCircleColor();
    return MGLStyleValueTransformer<mbgl::Color, MGLColor *>().toStyleValue(propertyValue);
}

- (void)setCircleOpacity:(MGLStyleValue<NSNumber *> *)circleOpacity {
    MGLAssertStyleLayerIsValid();

    auto mbglValue = MGLStyleValueTransformer<float, NSNumber *>().toPropertyValue(circleOpacity);
    self.rawLayer->setCircleOpacity(mbglValue);
}

- (MGLStyleValue<NSNumber *> *)circleOpacity {
    MGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getCircleOpacity() ?: self.rawLayer->getDefaultCircleOpacity();
    return MGLStyleValueTransformer<float, NSNumber *>().toStyleValue(propertyValue);
}

- (void)setCirclePitchScale:(MGLStyleValue<NSValue *> *)circlePitchScale {
    MGLAssertStyleLayerIsValid();

    auto mbglValue = MGLStyleValueTransformer<mbgl::style::CirclePitchScaleType, NSValue *, mbgl::style::CirclePitchScaleType, MGLCirclePitchScale>().toEnumPropertyValue(circlePitchScale);
    self.rawLayer->setCirclePitchScale(mbglValue);
}

- (MGLStyleValue<NSValue *> *)circlePitchScale {
    MGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getCirclePitchScale() ?: self.rawLayer->getDefaultCirclePitchScale();
    return MGLStyleValueTransformer<mbgl::style::CirclePitchScaleType, NSValue *, mbgl::style::CirclePitchScaleType, MGLCirclePitchScale>().toEnumStyleValue(propertyValue);
}

- (void)setCircleRadius:(MGLStyleValue<NSNumber *> *)circleRadius {
    MGLAssertStyleLayerIsValid();

    auto mbglValue = MGLStyleValueTransformer<float, NSNumber *>().toPropertyValue(circleRadius);
    self.rawLayer->setCircleRadius(mbglValue);
}

- (MGLStyleValue<NSNumber *> *)circleRadius {
    MGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getCircleRadius() ?: self.rawLayer->getDefaultCircleRadius();
    return MGLStyleValueTransformer<float, NSNumber *>().toStyleValue(propertyValue);
}

- (void)setCircleStrokeColor:(MGLStyleValue<MGLColor *> *)circleStrokeColor {
    MGLAssertStyleLayerIsValid();

    auto mbglValue = MGLStyleValueTransformer<mbgl::Color, MGLColor *>().toPropertyValue(circleStrokeColor);
    self.rawLayer->setCircleStrokeColor(mbglValue);
}

- (MGLStyleValue<MGLColor *> *)circleStrokeColor {
    MGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getCircleStrokeColor() ?: self.rawLayer->getDefaultCircleStrokeColor();
    return MGLStyleValueTransformer<mbgl::Color, MGLColor *>().toStyleValue(propertyValue);
}

- (void)setCircleStrokeOpacity:(MGLStyleValue<NSNumber *> *)circleStrokeOpacity {
    MGLAssertStyleLayerIsValid();

    auto mbglValue = MGLStyleValueTransformer<float, NSNumber *>().toPropertyValue(circleStrokeOpacity);
    self.rawLayer->setCircleStrokeOpacity(mbglValue);
}

- (MGLStyleValue<NSNumber *> *)circleStrokeOpacity {
    MGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getCircleStrokeOpacity() ?: self.rawLayer->getDefaultCircleStrokeOpacity();
    return MGLStyleValueTransformer<float, NSNumber *>().toStyleValue(propertyValue);
}

- (void)setCircleStrokeWidth:(MGLStyleValue<NSNumber *> *)circleStrokeWidth {
    MGLAssertStyleLayerIsValid();

    auto mbglValue = MGLStyleValueTransformer<float, NSNumber *>().toPropertyValue(circleStrokeWidth);
    self.rawLayer->setCircleStrokeWidth(mbglValue);
}

- (MGLStyleValue<NSNumber *> *)circleStrokeWidth {
    MGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getCircleStrokeWidth() ?: self.rawLayer->getDefaultCircleStrokeWidth();
    return MGLStyleValueTransformer<float, NSNumber *>().toStyleValue(propertyValue);
}

- (void)setCircleTranslate:(MGLStyleValue<NSValue *> *)circleTranslate {
    MGLAssertStyleLayerIsValid();

    auto mbglValue = MGLStyleValueTransformer<std::array<float, 2>, NSValue *>().toPropertyValue(circleTranslate);
    self.rawLayer->setCircleTranslate(mbglValue);
}

- (MGLStyleValue<NSValue *> *)circleTranslate {
    MGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getCircleTranslate() ?: self.rawLayer->getDefaultCircleTranslate();
    return MGLStyleValueTransformer<std::array<float, 2>, NSValue *>().toStyleValue(propertyValue);
}

- (void)setCircleTranslateAnchor:(MGLStyleValue<NSValue *> *)circleTranslateAnchor {
    MGLAssertStyleLayerIsValid();

    auto mbglValue = MGLStyleValueTransformer<mbgl::style::TranslateAnchorType, NSValue *, mbgl::style::TranslateAnchorType, MGLCircleTranslateAnchor>().toEnumPropertyValue(circleTranslateAnchor);
    self.rawLayer->setCircleTranslateAnchor(mbglValue);
}

- (MGLStyleValue<NSValue *> *)circleTranslateAnchor {
    MGLAssertStyleLayerIsValid();

    auto propertyValue = self.rawLayer->getCircleTranslateAnchor() ?: self.rawLayer->getDefaultCircleTranslateAnchor();
    return MGLStyleValueTransformer<mbgl::style::TranslateAnchorType, NSValue *, mbgl::style::TranslateAnchorType, MGLCircleTranslateAnchor>().toEnumStyleValue(propertyValue);
}


@end
