// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "Components/ActorComponent.h"
#include "Math/Vector2D.h"
#include "Math/Vector.h"
#include "Math/Color.h"
#include "modelLoader3D.generated.h"

DECLARE_DYNAMIC_DELEGATE_OneParam(FonFinishLoading, bool, isComplete);

UCLASS(ClassGroup = (Custom), meta = (BlueprintSpawnableComponent))
class VR_API UmodelLoader3D : public UActorComponent {
	GENERATED_BODY()

public:
	// Sets default values for this component's properties
	UmodelLoader3D();
	~UmodelLoader3D();

protected:
	// Called when the game starts
	virtual void BeginPlay() override;

public:
	// Called every frame
	virtual void TickComponent(float DeltaTime, ELevelTick TickType, FActorComponentTickFunction* ThisTickFunction) override;

	TArray<TArray<int32>> trianglesParts;

	UPROPERTY(BlueprintRead, VisibleAnywhere)
	TArray<FVector> points;
	UPROPERTY(BlueprintRead, VisibleAnywhere)
	TArray<FVector> normals;
	UPROPERTY(BlueprintRead, VisibleAnywhere)
	TArray<FVector> tangents;
	UPROPERTY(BlueprintRead, VisibleAnywhere)
	TArray<int32> triangles;
	UPROPERTY(BlueprintRead, VisibleAnywhere)
	TArray<FVector2D> uv;

	UPROPERTY(BlueprintRead, VisibleAnywhere)
	TArray<FLinearColor> colors;

	UFUNCTION(BlueprintCallable, Category = "loader")
	TArray<FVector>& getPoints();
	UFUNCTION(BlueprintCallable, Category = "loader")
	TArray<int32>& getTriangles();
	UFUNCTION(BlueprintCallable, Category = "loader")
	TArray<FVector>& getNormals();
	UFUNCTION(BlueprintCallable, Category = "loader")
	TArray<FVector2D>& getUv();
	UFUNCTION(BlueprintCallable, Category = "loader")
	TArray<FLinearColor>& getColors();

	UFUNCTION(BlueprintCallable, Category = "loader", BlueprintPure)
	TArray<int32>& getTrianglePart(int32 part);

	UFUNCTION(BlueprintCallable, Category = "loader", BlueprintPure)
	void getAll(TArray<FVector>& pointsVector, TArray<FVector>& normalsVector, TArray<FVector>& tangentsVector, TArray<int32>& trianglesVector, TArray<FVector2D>& uvVector);

	UFUNCTION(BlueprintCallable, Category = "loader", BlueprintPure)
	int32 getNumParts();
	UFUNCTION(BlueprintCallable, Category = "loader", BlueprintPure)
	void getPart(int32 partIndex, TArray<FVector>& pointsVector, TArray<int32>& trianglesVector, TArray<FVector>& normalsVector);

	UFUNCTION(BlueprintCallable, Category = "loader")
	void generate(FString file);

	UFUNCTION(BlueprintCallable, Category = "loader", meta = (Keywords = "http"))
	void httpFileDownload(FString name, FonFinishLoading Out);
};
